part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitialState extends SignUpState {}

class SignUpSuccessfullyState extends SignUpState {}

class SignUpFailedState extends SignUpState {
  final String message;
  SignUpFailedState({required this.message});
}
