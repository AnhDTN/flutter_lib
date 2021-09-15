import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

/// flutter pub run build_runner build --delete-conflicting-outputs
part 'api.g.dart';

@RestApi(baseUrl: "")
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  // @GET("/course/list")
  // Future<ApiResponse<List<Course>>> getCourseList();

}
