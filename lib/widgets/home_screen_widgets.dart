import 'package:flutter/material.dart';
import 'package:meher_kitchen/constants/app_color_constants.dart';

class HomeScreenInitialUI extends StatelessWidget {
  const HomeScreenInitialUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.registerScreenBackgroundColor,
      child: Column(
        children: [
          //row
          Container(
            color: Colors.red,
            height: height * 0.1,
          ),
          //text
          Container(
            color: Colors.yellow,
            height: height * 0.06,
          ),
          //subtext
          Container(
            color: Colors.pink,
            height: height * 0.04,
          ),
          //tabBar
          Container(
            color: Colors.black,
            height: height * 0.05,
          ),
          //text
          Container(
            color: Colors.purple,
            height: height * 0.1,
          ),
          //gridView
          Container(
            color: Colors.red,
            height: height * 0.65,
          ),
        ],
      ),
    );
  }
}
