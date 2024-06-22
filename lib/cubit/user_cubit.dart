
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_tech_mastering_api_with_flutter/cubit/user_state.dart';
import 'package:happy_tech_mastering_api_with_flutter/models/sign_in_model.dart';
import 'package:happy_tech_mastering_api_with_flutter/repositories/user_repo.dart';
import 'package:image_picker/image_picker.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepo) : super(UserInitial());
  final UserRepo userRepo ;

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
  TextEditingController signUpConfirmPassword = TextEditingController();

  SignInModel? userResponseModel;



  signUp() async {
    emit(LoadingState());
   final response= await userRepo.signUp(
        name: signUpName.text,
        email: signUpEmail.text,
        phone: signUpPhoneNumber.text,
        password: signUpPassword.text,
        confirmPassword: signUpConfirmPassword.text,
        profilePic: profilePic!);

   final signUpModel=response.$1;
   final errorMessage= response.$2;

   if(signUpModel!=null)emit(SignUpSuccessState(message: signUpModel.message));
   if(errorMessage!=null)emit(SignUpFailureState(errorMessage:errorMessage ));

  }
  
  signIn() async {
    emit(LoadingState());
    final response=await userRepo.signIn(
        email: signInEmail.text,
        password: signInPassword.text);

    final signInModel=response.$1;
    final errorMessage=response.$2;
    if(signInModel!=null)emit(SignInSuccessState());
    if(errorMessage!=null)emit(SignInFailureState(errorMessage:errorMessage ));


  }

  uploadProfilePic(XFile image)
  {
    profilePic=image;
    emit(UploadProfilePicState());
  }

  getUserData() async
  {
    emit(LoadingState());
final response=await userRepo.getUserData();
    final userModel=response.$1;
    final errorMessage=response.$2;
    if(userModel!=null)emit(GetUserSuccessState(userModel: userModel));
    if(errorMessage!=null)emit(GetUserFailureState(errorMessage:errorMessage ));



  }

  // deleteUser()async{
  //   try {
  //     emit(LoadingState());
  //     final response = await api.delete(EndPoints.deleteUser,
  //         isFormData: true,
  //         queryParameters: {
  //           " id": prefs.getString(ApiKey.id)
  //         });
  //     final deleteModel = DeleteModel.fromJson(response);
  //     if (deleteModel.message != null && deleteModel.error == null &&
  //         deleteModel.status == null && deleteModel.errorMessage == null) {
  //       emit(DeleteSuccessState(message: deleteModel.message!));
  //
  //     } else if (deleteModel.error != null ) {
  //       emit(DeleteFailureState(
  //           errorMessage: deleteModel.errorMessage,
  //           status: deleteModel.status!,
  //           error: deleteModel.error));
  //
  //
  //     } else if (deleteModel.status != null && deleteModel.error != null) {
  //       emit(DeleteInvalidState(errorMessage: deleteModel.errorMessage!));
  //     } else {
  //       emit(DeleteFailureState(errorMessage: 'Unknown error occurred', status: deleteModel.status!, error: deleteModel.error!,));
  //     }
  //   }
  //       on ServerException catch(e)
  //
  //   {
  //     emit(DeleteFailureState(errorMessage: e.errMod.errorMessage));
  //
  //   }
  // }
  
  editUserData()
  async {

  }

  
}
