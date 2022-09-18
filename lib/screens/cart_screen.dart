import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meher_kitchen/bloc/cart_bloc/cart_bloc.dart';
import 'package:meher_kitchen/widgets/cart_screen_widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartEmptyState) {
            return CartScreenEmptyUI();
          } else if (state is CartLoadedState) {
            return CartScreenLoadedUI(
              list: state.list,
              subtotalPrice: state.subTotalPrice,
              salesTax: state.salesTax,
              deliverCharges: state.deliverCharges,
              total: state.total,
            );
          } else if (state is CartDeleteAllItemState) {
            return CartScreenEmptyUI();
          } else if (state is CartDeleteSingleItemSate) {
            return CartScreenLoadedUI(
              list: state.list,
              subtotalPrice: state.subTotalPrice,
              salesTax: state.salesTax,
              deliverCharges: state.deliveryCharges,
              total: state.total,
            );
          } else if (state is CartAdditionOfQuantityState) {
            return CartScreenLoadedUI(
              list: state.list,
              subtotalPrice: state.subTotalPrice,
              salesTax: state.salesTax,
              deliverCharges: state.deliveryCharges,
              total: state.total,
            );
          } else if (state is CartSubtractionOfQuantityState) {
            return CartScreenLoadedUI(
              list: state.list,
              subtotalPrice: state.subTotalPrice,
              salesTax: state.salesTax,
              deliverCharges: state.deliveryCharges,
              total: state.total,
            );
          } else {
            return Center(
              child: Text('Cart Builder Error'),
            );
          }
        },
      ),
    ));
  }
}
