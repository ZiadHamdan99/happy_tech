import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor
{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["lang"]="ar";
    super.onRequest(options, handler);
  }

}