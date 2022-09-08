part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class SignInInitialState extends SignInState {}

class SignInSuccessfullyState extends SignInState {}

class SignInFailedState extends SignInState {
  final String message;
  SignInFailedState({required this.message});
}

class SignInWithGoogleSuccessfullyState extends SignInState {}

class SignInWithGoogleFailedState extends SignInState {
  final String message;
  SignInWithGoogleFailedState({required this.message});
}
