import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meher_kitchen/constants/app_color_constants.dart';
import 'package:meher_kitchen/screens/home_screen.dart';
import 'package:meher_kitchen/screens/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? id;
  void getClientId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    id = sharedPreferences.getInt('clientId');
  }

  @override
  void initState() {
    getClientId();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          if (id != null) {
            return HomeScreen();
          } else {
            return SignInScreen();
          }
        },
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: AppColors.registerScreenBackgroundColor,
        child: Center(
          child: Container(
            height: height * 0.4,
            width: width * 0.4,
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: Lottie.asset('assets/splash_screen_lottie.json'),
          ),
        ),
      ),
    );
  }
}
