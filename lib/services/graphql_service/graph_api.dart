import 'dart:developer';

import 'package:flutter_lib/config/app_config.dart';
import 'package:flutter_lib/model/graphql_response.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql/client.dart';

class GraphAPI {
  Map<String, String> headers = {
    "content-type": "application/json",
    "x-hasura-admin-secret": AppConfig.hasuraSecret
  };

  late HttpLink _httpLink;
  late GraphQLClient _client;

  init() {
    _httpLink = HttpLink(AppConfig.baseGraphqlUrl, defaultHeaders: headers);
    _client = GraphQLClient(cache: GraphQLCache(), link: _httpLink);
  }

  Future<GraphQlResponse> query(
      {required String sql, required Map<String, dynamic> variables}) async {
    init();
    final QueryOptions options = QueryOptions(
      document: gql(sql),
      variables: variables,
      fetchPolicy: FetchPolicy.cacheAndNetwork,
    );
    try {
      final QueryResult result = await _client.query(options);
      log("URL: ${AppConfig.baseGraphqlUrl}");
      log("SQL: $sql");
      log("PARAMS: $variables");
      if (result.hasException) {
        log("ERROR: ${result.exception}");
        throw result.exception!.graphqlErrors;
      } else {
        log("RESPONSE: ${result.data}");
        return GraphQlResponse(200, null, result.data);
      }
    } on GraphQLError catch (e) {
      throw [e];
    }
  }

  Future<GraphQlResponse> mutation<T>(
      {required String sql, required Map<String, dynamic> variables}) async {
    init();
    final MutationOptions options = MutationOptions(
      document: gql(sql),
      variables: variables,
      fetchPolicy: FetchPolicy.cacheAndNetwork,
    );
    try {
      final QueryResult result = await _client.mutate(options);
      log("URL: ${AppConfig.baseGraphqlUrl}");
      log("SQL: $sql");
      log("PARAMS: $variables");

      if (result.hasException) {
        log("ERROR: ${result.exception}");
        if(result.exception!.graphqlErrors.isNotEmpty) {
          throw result.exception!.graphqlErrors[0];
        } else {
          throw GraphQLError(message: "Something went wrong");
        }
      } else {
        log("RESPONSE: ${result.data}");
        return GraphQlResponse(200, null, result.data);
      }
    } on GraphQLError catch (e) {
      throw e;
    }
  }
}
