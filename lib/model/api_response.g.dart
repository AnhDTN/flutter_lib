// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) {
  return ApiResponse<T>(
    json['message'] as String?,
    json['code'] as int,
    _$nullableGenericFromJson(json['items'], fromJsonT),
    _$nullableGenericFromJson(json['data'], fromJsonT),
    json['description'] as String?,
  );
}

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'items': _$nullableGenericToJson(instance.items, toJsonT),
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'description': instance.description,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
