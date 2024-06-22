 import 'package:happy_tech_mastering_api_with_flutter/models/user_model.dart';

class UserState {}

 final class UserInitial extends UserState {}

 final class SignInSuccessState extends UserState {}

 final class UploadProfilePicState extends UserState {}

 final class LoadingState extends UserState {}

 final class SignInFailureState extends UserState {
  final String errorMessage;
  SignInFailureState({required this.errorMessage});
 }


 final class SignUpSuccessState extends UserState {
  final String message;

  SignUpSuccessState({required this.message});
 }


 final class SignUpFailureState extends UserState {
  final String errorMessage;
  SignUpFailureState({required this.errorMessage});
 }




 final class GetUserSuccessState extends UserState {
  final UserModel userModel;

  GetUserSuccessState({required this.userModel});
 }


 final class GetUserFailureState extends UserState {
  final String errorMessage;
  GetUserFailureState({required this.errorMessage});
 }
