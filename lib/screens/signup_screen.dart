import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meher_kitchen/screens/signin_screen.dart';
import 'package:meher_kitchen/widgets/signup_screen_widgets.dart';

import '../bloc/signup_bloc/sign_up_bloc.dart';

class SignUpScreen extends StatelessWidget {
  static int clientId = 0;
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          if (state is SignUpInitialState) {
            return SignUpInitialScreenUI();
          } else if (state is SignUpSuccessfullyState) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SignInScreen();
                },
              ));
            });
            return SizedBox();
          } else if (state is SignUpFailedState) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            });
            return SignUpInitialScreenUI();
          } else {
            return Center(
              child: Text('Builder Error'),
            );
          }
        },
      )),
    );
  }
}
