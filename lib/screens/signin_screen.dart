import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meher_kitchen/bloc/signin_bloc/sign_in_bloc.dart';
import 'package:meher_kitchen/screens/home_screen.dart';
import 'package:meher_kitchen/widgets/signin_screen_widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.brown,
            body: BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInInitialState) {
                  return SignInScreenInitialUI();
                } else if (state is SignInSuccessfullyState) {
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ));
                  });
                  return SizedBox();
                } else if (state is SignInFailedState) {
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  });
                  return SignInScreenInitialUI();
                } else if (state is SignInWithGoogleSuccessfullyState) {
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ));
                  });
                  return SizedBox();
                } else if (state is SignInWithGoogleFailedState) {
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  });
                  return SignInScreenInitialUI();
                } else {
                  return Center(
                    child: Text('Builder Error'),
                  );
                }
              },
            )));
  }
}
