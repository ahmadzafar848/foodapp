part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {}

class SignInInitialEvent extends SignInEvent {}

class SignInSuccessfullyEvent extends SignInEvent {
  final SignInUserModel model;
  SignInSuccessfullyEvent({required this.model});
}

class SignInWithGoogleEvent extends SignInEvent {
  final SignInWithGoogleModel signInWithGoogleModel;
  SignInWithGoogleEvent({required this.signInWithGoogleModel});
}
