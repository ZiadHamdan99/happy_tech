import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';

class DeleteModel
{
  final int? status;
  final String? message;
  final String? errorMessage;
  final List<String>? error;

  DeleteModel({required this.errorMessage,required this.status, required this.message, required this.error});



  factory DeleteModel.fromJson(Map<String,dynamic>jsonData)
  {
    return DeleteModel(
        status: jsonData[ApiKey.status],
        message: jsonData[ApiKey.message],
        error: jsonData[ApiKey.error],
        errorMessage:jsonData[ApiKey.errorMessage],);

  }


}

