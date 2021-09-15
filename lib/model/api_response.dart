import 'package:json_annotation/json_annotation.dart';
part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  ApiResponse( this.message, this.code, this.items, this.data, this.description);
  final int code;
  final String? message;
  final T? items;
  final T? data;
  final String? description;
  factory ApiResponse.fromJson(Map<String, dynamic> json,
      T Function(Object? json) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$ApiResponseToJson(this, toJsonT);
}
