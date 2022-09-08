part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpInitialEvent extends SignUpEvent {}

class SignUpSuccessfullyEvent extends SignUpEvent {
  final SignUpUserModel model;
  SignUpSuccessfullyEvent({required this.model});
}

// class SignUpFailedEvent extends SignUpEvent {}
