import 'dart:math';

import 'package:flutter/material.dart';
import 'package:meher_kitchen/bloc/signup_bloc/sign_up_bloc.dart';
import 'package:meher_kitchen/constants/app_color_constants.dart';
import 'package:meher_kitchen/models/signup_user_model.dart';
import 'package:meher_kitchen/widgets/common_widgets/custom_textformfield.dart';
import 'package:provider/provider.dart';

import '../constants/reg_expressions.dart';

class SignUpInitialScreenUI extends StatelessWidget {
  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SignUpInitialScreenUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpBloc = Provider.of<SignUpBloc>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double minimum = min(height, width);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.05,
            child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(minimum * 0.02),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.cancel,
                      color: AppColors.iconColor,
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: height * 0.1,
          ),
          SizedBox(
            height: height * 0.1,
            child: Center(
              child: Text(
                'Meher Kitchen',
                style: TextStyle(
                    color: AppColors.textFormFieldFocusBorderColor,
                    fontSize: minimum * 0.07,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                    validatorFunction: (value) {
                      if (value!.isEmpty) {
                        return 'First Name Required ';
                      }
                      if (nameRegExp.hasMatch(value)) {
                        return null;
                      }
                      return 'Not a Valid Name';
                    },
                    controller: firstNameTextEditingController,
                    hintText: 'First Name',
                    prefixIcon: Icons.person),
                CustomTextFormField(
                    validatorFunction: (value) {
                      if (value!.isEmpty) {
                        return 'Last Name Required ';
                      }
                      if (nameRegExp.hasMatch(value)) {
                        return null;
                      }
                      return 'Not a Valid Name';
                    },
                    controller: lastNameTextEditingController,
                    hintText: 'Last Name',
                    prefixIcon: Icons.person),
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
          SizedBox(
            height: height * 0.05,
          ),
          InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                signUpBloc.add(SignUpSuccessfullyEvent(
                    model: SignUpUserModel(
                        email: emailTextEditingController.text,
                        password: passwordTextEditingController.text,
                        displayName: firstNameTextEditingController.text +
                            lastNameTextEditingController.text,
                        loginBy: '1')));
              }
            },
            child: Container(
              width: width * 0.5,
              height: height * 0.07,
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(width * 0.05)),
            ),
          ),
          SizedBox(
            height: height * 0.18,
          ),
        ],
      ),
    );
  }
}
