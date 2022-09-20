import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meher_kitchen/bloc/confirm_order_bloc/confirm_order_bloc.dart';
import 'package:meher_kitchen/bloc/home_screen_bloc/home_screen_category_bloc/home_screen_category_bloc.dart';
import 'package:meher_kitchen/bloc/home_screen_bloc/home_screen_product_bloc/home_screen_product_bloc.dart';
import 'package:meher_kitchen/bloc/signin_bloc/sign_in_bloc.dart';
import 'package:meher_kitchen/bloc/signup_bloc/sign_up_bloc.dart';
import 'package:meher_kitchen/screens/splash_screen.dart';

import 'bloc/cart_bloc/cart_bloc.dart';
import 'bloc/detail_screen_add_to_cart_bloc/detail_screen_add_to_cart_bloc.dart';

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
        BlocProvider<DetailScreenAddToCartBloc>(
          create: (context) => DetailScreenAddToCartBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
        BlocProvider<ConfirmOrderBloc>(
          create: (context) => ConfirmOrderBloc(),
        ),
      ],
      child: MaterialApp(home: SplashScreen()),
    );
  }
}
