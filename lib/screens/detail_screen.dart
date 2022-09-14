import 'package:flutter/material.dart';

import '../widgets/detail_screen_widgets.dart';

class DetailScreen extends StatelessWidget {
  String? imageFile;
  String? salePrice;
  String? productName;
  String? description;
  DetailScreen(
      {Key? key,
      this.imageFile,
      this.salePrice,
      this.productName,
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DetailScreenInitialUI(
          imageFile: imageFile,
          salePrice: salePrice,
          productName: productName,
          description: description,
        ),
      ),
    );
  }
}
