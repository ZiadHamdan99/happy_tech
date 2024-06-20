 class UserState {}

 final class UserInitial extends UserState {}

 final class SignInSuccessState extends UserState {}

 final class LoadingState extends UserState {}

 final class SignInFailureState extends UserState {
  final String errorMessage;
  SignInFailureState({required this.errorMessage});
 }
