import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_lib/config/app_config.dart';

import 'api.dart';

class ApiException {
  int? httpCode;
  String? message;

  ApiException({this.httpCode = 1000, this.message = "Đã có lỗi xảy ra"});
}

class AppApi {
  static final AppApi _singleton = new AppApi._internal();

  factory AppApi() {
    return _singleton;
  }

  static final _dio = Dio(BaseOptions(
    connectTimeout: 30000,
    receiveTimeout: 15000,
  ));
  static final Api _client = Api(_dio, baseUrl: AppConfig.baseRestfulUrl);

  static Api getClient() => _client;

  static Future<T> fetchData<T>(Future<T> Function() func) async {
    try {
      T? result = await func();
      return Future.value(result);
    } catch (e) {
      var apiEx = await _getDioException(e);
      print("API ERROR: ${apiEx.message}");
      return Future.error(apiEx);
    }
  }

  static setInterceptorDio(String key, String value) {
    _dio.options.headers[key] = value;
  }

  static clearInterceptorDio() {
    _dio.options.headers.clear();
  }

  static Future<ApiException> _handleResponse(int? statusCode, String? mess) async{
    // switch (statusCode) {
      // case 400:
      //   return ApiException(httpCode: statusCode, message: mess);
      // case 401:
        // Future.delayed(Duration(milliseconds: 300), () async {
        //   await _authRepo.removeAuth();
        // });
        // return ApiException(httpCode: statusCode, message: mess);
      // case 403:
      //   return ApiException(httpCode: statusCode, message: mess);
      // case 404:
      //   return ApiException(httpCode: statusCode, message: mess);
      // case 409:
      //   return ApiException(httpCode: statusCode, message: mess);
      // case 408:
      //   return ApiException(httpCode: statusCode, message: mess);
      // case 500:
      //   return ApiException(httpCode: statusCode, message: mess);
      // case 503:
      //   return ApiException(httpCode: statusCode, message: mess);
      //   // ignore: dead_code
      // default:
        return ApiException(
          httpCode: statusCode,
          message: mess,
        );
    // }
  }

  static Future<ApiException> _getDioException(e) async {
    if (e is Exception) {
      try {
        ApiException errorExceptions;
        if (e is DioError) {
          var  errorMess = "Đã có lỗi xảy ra!";
          switch (e.type) {
            case DioErrorType.cancel:
              errorExceptions = ApiException(
                  httpCode: e.response?.statusCode,
                  message: errorMess);
              break;
            case DioErrorType.connectTimeout:
              errorExceptions = ApiException(
                  httpCode: e.response?.statusCode,
                  message: errorMess);
              break;
            case DioErrorType.other:
              errorExceptions = ApiException(
                  httpCode: e.response?.statusCode,
                  message: errorMess);
              break;
            case DioErrorType.receiveTimeout:
              errorExceptions = ApiException(
                  httpCode: e.response?.statusCode,
                  message: errorMess);
              break;
            case DioErrorType.response:
              errorExceptions = await _handleResponse(
                  e.response?.statusCode, errorMess);
              break;
            case DioErrorType.sendTimeout:
              errorExceptions = ApiException(
                  httpCode: e.response?.statusCode!,
                  message: errorMess);
              break;
          }
        } else if (e is SocketException) {
          errorExceptions = ApiException(httpCode: 999,message: "Vui lòng kiểm tra kết nối mạng !");
        } else {
          errorExceptions = ApiException();
        }
        return errorExceptions;
      } on FormatException catch (_) {
        return ApiException();
      } catch (_) {
        return ApiException();
      }
    } else {
      if (e.toString().contains("is not a subtype of")) {
        return ApiException();
      } else {
        return ApiException();
      }
    }
  }

  AppApi._internal();
}
