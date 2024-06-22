import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/location_model.dart';

class UserModel
{
  final String profilePic;
  final String name;
  final String phone;
  final String email;
  final LocationModel? location;

  UserModel({required this.profilePic, required this.name, required this.phone, required this.email, required this.location});


  factory UserModel.fromJson(Map<String,dynamic>jsonData)
  {
    return UserModel(
        profilePic: jsonData["user"][ApiKey.profilePic],
        name: jsonData["user"][ApiKey.name],
        phone: jsonData["user"][ApiKey.phone],
        email:jsonData["user"][ApiKey.email] ,
      location: jsonData["user"][ApiKey.location] != null
          ? LocationModel.fromJson(jsonData["user"][ApiKey.location])
          : null,);
  }

}

