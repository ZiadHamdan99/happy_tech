import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';

class PatchModel
{
   final String message;

  PatchModel({required this.message});

  factory PatchModel.fromJson(Map<String,dynamic>jsonData)
  {
    return PatchModel(
      message: jsonData[ApiKey.message],
    );

  }

}
