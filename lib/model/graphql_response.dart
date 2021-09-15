import 'package:json_annotation/json_annotation.dart';
part 'graphql_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GraphQlResponse {
  GraphQlResponse(this.status, this.message, this.data);

  factory GraphQlResponse.fromJson(Map<String, dynamic> json) =>
      _$GraphQlResponseFromJson(json);

  final int status;
  final String? message;
  final Map<String, dynamic>? data;

  Map<String, dynamic> toJson() => _$GraphQlResponseToJson(this);
}
