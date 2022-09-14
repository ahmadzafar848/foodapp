import 'package:flutter/material.dart';

import '../widgets/checkout_screen_widgets.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: CheckoutScreenInitialUI()));
  }
}
