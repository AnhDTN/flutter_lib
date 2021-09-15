// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GraphQlResponse _$GraphQlResponseFromJson(Map<String, dynamic> json) {
  return GraphQlResponse(
    json['status'] as int,
    json['message'] as String?,
    json['data'] as Map<String, dynamic>?,
  );
}

Map<String, dynamic> _$GraphQlResponseToJson(GraphQlResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
