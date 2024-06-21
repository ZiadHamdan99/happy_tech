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
