
import 'package:flutter/cupertino.dart';
import 'package:flutter_lib/services/restful_api_service/app_api.dart';
import 'package:http/http.dart';


class BaseVM with ChangeNotifier {

  var isLoading = false;

  var requestDispatch = false;

  var client = AppApi.getClient();

  Future<T?> _onRequest<T>(Future<T> Function() function) async {
    requestDispatch = false;
    isLoading = true;
    notifyListeners();
    try {
      var result = await function();
      isLoading = false;
      notifyListeners();
      return result;
    } on Exception catch (e) {
      isLoading = false;
      notifyListeners();
      onException(e);
    }
    return null;
  }

  Future<T?> request<T>({
    required Future<T> function,
  }) async {
    return _onRequest(() async => await function);
  }

  Map<String, String> _getHeaders(Map<String, String>? headers) {
    Map<String, String> fHeaders = {'Content-Type': 'application/json'};
    if (headers != null) fHeaders.addAll(headers);
    return fHeaders;
  }

  bool isSuccessfully(Response response) {
    return response.statusCode > 199 &&
        response.statusCode < 300;
  }

  onException(Exception e) {}

  bool isApiSuccess(int? status) => (status ?? 0) >= 200 && (status ?? 0) < 300;
}
