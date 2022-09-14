import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meher_kitchen/bloc/home_screen_bloc/home_screen_category_bloc/home_screen_category_bloc.dart';
import 'package:meher_kitchen/bloc/home_screen_bloc/home_screen_product_bloc/home_screen_product_bloc.dart';
import 'package:meher_kitchen/bloc/signin_bloc/sign_in_bloc.dart';
import 'package:meher_kitchen/bloc/signup_bloc/sign_up_bloc.dart';
import 'package:meher_kitchen/screens/home_screen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider<HomeScreenCategoryBloc>(
          create: (context) => HomeScreenCategoryBloc(),
        ),
        BlocProvider<HomeScreenProductBloc>(
          create: (context) => HomeScreenProductBloc(),
        ),
      ],
      child: MaterialApp(home: HomeScreen()),
    );
  }
}
