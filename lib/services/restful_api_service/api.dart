import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_lib/model/job.dart';
import 'package:flutter_lib/model/api_response.dart';
import 'package:retrofit/http.dart';

/// flutter pub run build_runner build --delete-conflicting-outputs
part 'api.g.dart';

@RestApi(baseUrl: "")
abstract class Api {
  factory Api(Dio dio, {String baseUrl}) = _Api;

  @GET("/posts")
  Future<ApiResponse<List<Job>>> getPosts(@Query("page") int page);
}
