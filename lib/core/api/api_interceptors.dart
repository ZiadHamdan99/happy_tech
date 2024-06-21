import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor
{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accepted-Language"]="en";
    super.onRequest(options, handler);
  }

}