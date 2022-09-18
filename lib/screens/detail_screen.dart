import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meher_kitchen/bloc/detail_screen_add_to_cart_bloc/detail_screen_add_to_cart_bloc.dart';
import 'package:provider/provider.dart';

import '../widgets/detail_screen_widgets.dart';

class DetailScreen extends StatelessWidget {
  String? imageFile;
  double? salePrice;
  String? productName;
  String? description;
  String? productId;
  DetailScreen(
      {Key? key,
      this.imageFile,
      this.salePrice,
      this.productName,
      this.description,
      this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detailScreenBloc =
        Provider.of<DetailScreenAddToCartBloc>(context, listen: false);
    detailScreenBloc.add(DetailScreenAddToCartInitialEvent());
    return SafeArea(
      child: Scaffold(body:
          BlocBuilder<DetailScreenAddToCartBloc, DetailScreenAddToCartState>(
        builder: (context, state) {
          if (state is DetailScreenAddToCartInitialState) {
            return DetailScreenInitialUI(
              productId: productId,
              imageFile: imageFile,
              description: description,
              productName: productName,
              salePrice: salePrice,
            );
          } else if (state is DetailScreenAddToCartSuccessfullyState) {
            detailScreenBloc.add(DetailScreenAddToCartInitialEvent());
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            });
            return DetailScreenInitialUI(
              imageFile: imageFile,
              description: description,
              productName: productName,
              salePrice: salePrice,
            );
          } else if (state is DetailScreenAddToCartFailedState) {
            detailScreenBloc.add(DetailScreenAddToCartInitialEvent());
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            });
            return DetailScreenInitialUI(
              imageFile: imageFile,
              description: description,
              productName: productName,
              salePrice: salePrice,
            );
          } else {
            return Center(
              child: Text('No Screen'),
            );
          }
        },
      )),
    );
  }
}
