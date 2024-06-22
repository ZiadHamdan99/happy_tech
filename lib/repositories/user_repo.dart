
import 'package:happy_tech_mastering_api_with_flutter/cache/cache_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/api_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/exceptions.dart';
import 'package:happy_tech_mastering_api_with_flutter/functions/upload_img_to_api.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/patch_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/sign_in_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/sign_up_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserRepo
{
  final ApiConsumer api;

  UserRepo({required this.api});


  Future<(SignInModel?, String?)> signIn ({
    required String email,
    required String password})async
  {
  try{
  final response = await api.post(EndPoints.signIn,
  data: {
        ApiKey.email:email,
        ApiKey.password:password,
  });

  final userResponseModel=SignInModel.fromJson(response);

  final decodedToken = JwtDecoder.decode(userResponseModel.token);

  prefs.setString(ApiKey.token, userResponseModel.token);

  prefs.setString(ApiKey.id, decodedToken[ApiKey.id]);

    return (userResponseModel,"");

  } on ServerException catch(e)
  {
    return (null,e.errMod.errorMessage);

  }
  }

  Future<(SignUpModel?, String?)> signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required XFile profilePic
}) async
  {
    try{
      final response=await api.post(EndPoints.signUp,isFormData: true,data: {

        ApiKey.name:name,
        ApiKey.email:email,
        ApiKey.phone :phone,
        ApiKey.password:password,
        ApiKey.confirmPassword:confirmPassword,
        ApiKey.location:'{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
        ApiKey.profilePic:await uploadImageToApi(profilePic)
      });
      final signUpModel=SignUpModel.fromJson(response);

      return (signUpModel,null);
    }
    on ServerException catch(e)
    {
      return (null,e.errMod.errorMessage);


    }
  }

  Future<(UserModel?,String?)> getUserData ()async
  {
      try{
        final response = await api.get(EndPoints.getUserDataEndPoint(prefs.getString(ApiKey.id)),);
        return (UserModel.fromJson(response),null);

      } on ServerException catch(e)
      {
        return(null,e.errMod.errorMessage);
      }
  }

  Future<(PatchModel?,String?)> editUserData (
  { required String name ,
    required String phone ,
    required XFile profilePic ,}
  ) async
  {

    try{
      final response=await api.patch(EndPoints.updateUser,isFormData:true,data:
      {
        ApiKey.name:name,
        ApiKey.phone :phone,
        ApiKey.location:'{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
        ApiKey.profilePic:await uploadImageToApi(profilePic)

      } );
      final patchModel=PatchModel.fromJson(response);
      return(patchModel,null);



    } on ServerException catch(e)
    {
      return(null,e.errMod.errorMessage);

    }
  }
}