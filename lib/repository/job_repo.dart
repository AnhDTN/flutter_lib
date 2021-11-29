import 'package:flutter_lib/model/api_response.dart';
import 'package:flutter_lib/model/job.dart';
import 'package:flutter_lib/services/restful_api_service/app_api.dart';

class JobRepo {
  var client = AppApi.getClient();
  Future<ApiResponse<List<Job>>> getJobs(int page) async {
    return await AppApi.fetchData(() => client.getPosts(page));
  }
}