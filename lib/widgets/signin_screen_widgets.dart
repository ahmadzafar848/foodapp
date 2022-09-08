import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meher_kitchen/bloc/signin_bloc/sign_in_bloc.dart';
import 'package:meher_kitchen/bloc/signup_bloc/sign_up_bloc.dart';
import 'package:meher_kitchen/constants/app_color_constants.dart';
import 'package:meher_kitchen/models/signIn_user_model.dart';
import 'package:meher_kitchen/screens/signup_screen.dart';
import 'package:provider/provider.dart';

import '../constants/reg_expressions.dart';
import '../models/signin_with_google_model.dart';
import 'common_widgets/custom_textformfield.dart';

class SignInScreenInitialUI extends StatelessWidget {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SignInScreenInitialUI({Key? key}) : super(key: key);
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final signInBloc = Provider.of<SignInBloc>(context, listen: false);
    final signUpBloc = Provider.of<SignUpBloc>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double minimum = min(height, width);
    return SingleChildScrollView(
      child: Container(
        color: AppColors.registerScreenBackgroundColor,
        child: Column(
          children: [
            //space
            SizedBox(
              height: height * 0.1,
            ),
            //text
            SizedBox(
              height: height * 0.1,
              child: Center(
                child: Text(
                  'Meher Kitchen',
                  style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: minimum * 0.07,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //space
            SizedBox(
              height: height * 0.05,
            ),
            //textFormField and space
            Form(
              key: formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    validatorFunction: (value) => value!.isEmpty
                        ? 'Enter Your Email Here'
                        : (emailValid.hasMatch(value)
                            ? null
                            : 'Enter a Valid Email'),
                    controller: emailTextEditingController,
                    hintText: 'Email',
                    prefixIcon: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  CustomTextFormField(
                    validatorFunction: (value) {
                      if (value!.isEmpty) {
                        return 'Password can not be Empty';
                      }
                      if (value.length < 6) {
                        return 'Password min length is 6 Chars';
                      }
                      return null;
                    },
                    controller: passwordTextEditingController,
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.remove_red_eye,
                  )
                ],
              ),
            ),
            //space
            SizedBox(
              height: height * 0.05,
            ),
            //button
            InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  signInBloc.add(
                    SignInSuccessfullyEvent(
                      model: SignInUserModel(
                          email: emailTextEditingController.text,
                          password: passwordTextEditingController.text),
                    ),
                  );
                }
              },
              child: Container(
                height: height * 0.07,
                width: width * 0.5,
                child: Center(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(color: AppColors.iconColor, fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(
                  color: AppColors.textFormFieldFocusBorderColor,
                  borderRadius: BorderRadius.circular(minimum * 0.05),
                ),
              ),
            ),
            //space
            SizedBox(
              height: height * 0.03,
            ),
            //row
            SizedBox(
              height: height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: height * 0.003,
                    width: width * 0.3,
                    color: AppColors.textFormFieldBorderColor,
                  ),
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Text(
                        'Or',
                        style: TextStyle(
                            color: AppColors.textFormFieldBorderColor),
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.003,
                    width: width * 0.3,
                    color: AppColors.textFormFieldBorderColor,
                  )
                ],
              ),
            ),
            //googleButton
            GestureDetector(
              onTap: () {
                signInBloc.add(
                  SignInWithGoogleEvent(
                    signInWithGoogleModel: SignInWithGoogleModel(loginBy: '0'),
                  ),
                );
              },
              child: Container(
                height: height * 0.1,
                decoration: BoxDecoration(
                    color: AppColors.textFormFieldFocusBorderColor,
                    shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    'G',
                    style: TextStyle(
                        color: AppColors.textFormFieldBorderColor,
                        fontWeight: FontWeight.bold,
                        fontSize: minimum * 0.08),
                  ),
                ),
              ),
            ),
            //space
            SizedBox(
              height: height * 0.05,
            ),
            //text
            SizedBox(
              height: height * 0.05,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Dont have an Account?   ',
                      style: TextStyle(
                          color: AppColors.textFormFieldBorderColor,
                          fontSize: minimum * 0.03),
                    ),
                    TextSpan(
                        text: 'SignUp',
                        style: TextStyle(
                            color: AppColors.iconColor,
                            fontWeight: FontWeight.bold,
                            fontSize: minimum * 0.04),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            signUpBloc.add(SignUpInitialEvent());
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SignUpScreen();
                              },
                            ));
                          }),
                  ],
                ),
              ),
            ),
            //space
            SizedBox(
              height: height * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
