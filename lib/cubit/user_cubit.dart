import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cach/cach_helper.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/api_consumer.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/api/end_points.dart';
import 'package:happy_tech_mastering_api_with_flutter/core/errors/exceptions.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';
import 'package:happy_tech_mastering_api_with_flutter/functions/upload_img_to_api.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/sign_in_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/sign_up_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api ;

  //Sign in Form key
  GlobalKey<FormState> signInFormKey = GlobalKey();
  //Sign in email
  TextEditingController signInEmail = TextEditingController();
  //Sign in password
  TextEditingController signInPassword = TextEditingController();
  //Sign Up Form key
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  XFile? profilePic;
  //Sign up name
  TextEditingController signUpName = TextEditingController();
  //Sign up phone number
  TextEditingController signUpPhoneNumber = TextEditingController();
  //Sign up email
  TextEditingController signUpEmail = TextEditingController();
  //Sign up password
  TextEditingController signUpPassword = TextEditingController();
  //Sign up confirm password
  TextEditingController confirmPassword = TextEditingController();

  SignInModel? userResponseModel;



  signIn() async {
 try{
   emit(LoadingState());
   final response = await api.post(EndPoints.signIn,
       data: {
         ApiKey.email:signInEmail.text,
         ApiKey.password:signInPassword.text
       });

   userResponseModel=SignInModel.fromJson(response);

   final decodedToken = JwtDecoder.decode(userResponseModel!.token);

   prefs.setString(ApiKey.token, userResponseModel!.token);

   prefs.setString(ApiKey.id, decodedToken[ApiKey.id]);
   print(decodedToken["id"]);

   emit(SignInSuccessState());
 } on ServerException catch(e)
    {
      emit(SignInFailureState(errorMessage: e.errMod.errorMessage));

    }


  }
  
  signUp() async {
  try{
    emit(LoadingState());
    final response=await api.post(EndPoints.signUp,isFormData: true,data: {

      ApiKey.name:signUpName.text,
      ApiKey.email:signUpEmail.text,
      ApiKey.phone :signUpPhoneNumber.text,
      ApiKey.password:signUpPassword.text,
      ApiKey.confirmPassword:confirmPassword.text,
      ApiKey.location:'{"name":"methalfa","address":"meet halfa","coordinates":[30.1572709,31.224779]}',
      ApiKey.profilePic:await uploadImageToApi(profilePic!)
    });
    final signUpModel=SignUpModel.fromJson(response);

    emit(SignUpSuccessState(message: signUpModel.message));
  }
   on ServerException catch(e)
    {
      emit(SignUpFailureState(errorMessage: e.errMod.errorMessage));


    }
  }

  uploadProfilePic(XFile image)
  {
    profilePic=image;
    emit(UploadProfilePicState());
  }

  
}
