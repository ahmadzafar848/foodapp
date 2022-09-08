import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meher_kitchen/widgets/home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: HomeScreenInitialUI(),
      ),
    );
  }
}
