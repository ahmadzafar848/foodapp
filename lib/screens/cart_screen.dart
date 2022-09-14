import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meher_kitchen/widgets/cart_screen_widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CartScreenInitialUI(),
    ));
  }
}
