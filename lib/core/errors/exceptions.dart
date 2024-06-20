import 'package:dio/dio.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/error_model.dart';

class ServerException implements Exception
{
  final ErrorModel errMod;

  ServerException({required this.errMod});

}

void handleDioExceptions (DioException e)
{
  switch(e.type) {
  case DioExceptionType.connectionTimeout:
    throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));
  case DioExceptionType.sendTimeout:
    throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));
  case DioExceptionType.receiveTimeout:
    throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));
  case DioExceptionType.badCertificate:
    throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));
  case DioExceptionType.cancel:
    throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));
  case DioExceptionType.connectionError:
    throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));
  case DioExceptionType.unknown:
    throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));

  case DioExceptionType.badResponse:
  switch(e.response!.statusCode)
  {
    case 400:
      throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));

    case 401:
      throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));

    case 403:
      throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));

    case 404:
      throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));

    case 409:
      throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));

    case 422:
      throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));

    case 504:
      throw ServerException(errMod: ErrorModel.fromJson(e.response!.data));


  }
}
}