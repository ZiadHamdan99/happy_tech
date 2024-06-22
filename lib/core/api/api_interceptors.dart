import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/cache/cache_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';

class ApiInterceptors extends Interceptor
{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["token"]=prefs.getString(ApiKey.token) != null
        ? "FOODAPI ${prefs.getString(ApiKey.token)}"
        : null ;
    super.onRequest(options, handler);
  }

}