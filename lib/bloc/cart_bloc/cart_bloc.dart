import 'package:bloc/bloc.dart';
import 'package:meher_kitchen/models/cart_product_model.dart';
import 'package:meher_kitchen/utils/local_database/product_db_provider.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  ProductDbProvider productDbProvider = ProductDbProvider();
  CartBloc() : super(CartEmptyState()) {
    on<CartEmptyEvent>((event, emit) {
      emit.call(CartEmptyState());
    });
    on<CartLoadedEvent>((event, emit) async {
      double sum = 0;
      double subTotalPrice = 0;
      double salesTax = 0;
      double deliveryCharges = 200;
      double total = 0;
      try {
        List<CartProductModel> list =
            await productDbProvider.fetchProductFromDb();
        for (int i = 0; i < list.length; i++) {
          double a = list[i].price!;
          sum = sum + a;
        }
        subTotalPrice = sum;
        salesTax = (subTotalPrice * 10) / 100;
        total = subTotalPrice + salesTax + deliveryCharges;
        emit.call(CartLoadedState(
            list: list,
            subTotalPrice: subTotalPrice,
            salesTax: salesTax,
            deliverCharges: deliveryCharges,
            total: total));
      } catch (e) {
        emit.call(CartFailedState(message: 'Cart Bloc Error'));
      }
    });
    on<CartDeleteAllItemEvent>((event, emit) async {
      try {
        bool result = await productDbProvider.deleteAllProducts();
        if (result) {
          emit.call(CartEmptyState());
        } else {
          emit.call(CartFailedState(message: 'Can not delete all item'));
        }
      } catch (e) {
        emit.call(CartFailedState(message: 'Excepion of deltion all items'));
      }
    });

    on<CartDeleteSingleItemEvent>((event, emit) async {
      double sum = 0;
      double subTotalPrice = 0;
      double salesTax = 0;
      double deliveryCharges = 200;
      double total = 0;
      try {
        bool result =
            await productDbProvider.deleteProduct(event.cartProductModel);
        if (result) {
          try {
            List<CartProductModel> list =
                await productDbProvider.fetchProductFromDb();
            for (int i = 0; i < list.length; i++) {
              double a = list[i].price!;
              sum = sum + a;
            }
            subTotalPrice = sum;
            salesTax = (subTotalPrice * 10) / 100;
            total = subTotalPrice + salesTax + deliveryCharges;
            if (list.isNotEmpty) {
              emit.call(CartLoadedState(
                  list: list,
                  subTotalPrice: subTotalPrice,
                  salesTax: salesTax,
                  deliverCharges: deliveryCharges,
                  total: total));
            } else {
              emit.call(CartEmptyState());
            }
          } catch (e) {
            emit.call(CartFailedState(message: 'Cart Bloc Error'));
          }
        } else {
          emit.call(CartFailedState(message: 'false delete bloc'));
        }
      } catch (e) {
        emit.call(CartFailedState(
            message: 'Delete Single Item Failed Bloc Exception'));
      }
    });

    on<CartAdditionOfQuantityEvent>((event, emit) async {
      double sum = 0;
      double subTotalPrice = 0;
      double salesTax = 0;
      double deliveryCharges = 200;
      double total = 0;
      try {
        int quantity = event.cartProductModel.quantity!;
        String productId = event.cartProductModel.productId!;
        double singleItemPrice = event.cartProductModel.singleItemPrice!;
        bool result = await productDbProvider.updateProduct(CartProductModel(
            productId: productId,
            quantity: quantity + 1,
            price: singleItemPrice * (quantity + 1)));
        if (result) {
          try {
            List<CartProductModel> list =
                await productDbProvider.fetchProductFromDb();
            for (int i = 0; i < list.length; i++) {
              double a = list[i].price!;
              sum = sum + a;
            }
            subTotalPrice = sum;
            salesTax = (subTotalPrice * 10) / 100;
            total = subTotalPrice + salesTax + deliveryCharges;
            emit.call(CartAdditionOfQuantityState(
                list: list,
                subTotalPrice: subTotalPrice,
                salesTax: salesTax,
                deliveryCharges: deliveryCharges,
                total: total));
          } catch (e) {
            emit.call(CartFailedState(message: 'Cart Bloc Error'));
          }
        } else {
          emit.call(CartFailedState(message: 'false delete bloc'));
        }
      } catch (e) {
        CartFailedState(message: 'Addition Exception');
      }
    });
    on<CartSubtractionOfQuantityEvent>((event, emit) async {
      double sum = 0;
      double subTotalPrice = 0;
      double salesTax = 0;
      double deliveryCharges = 200;
      double total = 0;
      try {
        int quantity = event.cartProductModel.quantity!;
        String productId = event.cartProductModel.productId!;
        double singleItemPrice = event.cartProductModel.singleItemPrice!;
        double price = event.cartProductModel.price!;
        if (quantity > 1) {
          bool result = await productDbProvider.updateProduct(CartProductModel(
              productId: productId,
              quantity: quantity - 1,
              price: price - singleItemPrice));
          if (result) {
            try {
              List<CartProductModel> list =
                  await productDbProvider.fetchProductFromDb();
              for (int i = 0; i < list.length; i++) {
                double a = list[i].price!;
                sum = sum + a;
              }
              subTotalPrice = sum;
              salesTax = (subTotalPrice * 10) / 100;
              total = subTotalPrice + salesTax + deliveryCharges;
              emit.call(CartAdditionOfQuantityState(
                  list: list,
                  subTotalPrice: subTotalPrice,
                  salesTax: salesTax,
                  deliveryCharges: deliveryCharges,
                  total: total));
            } catch (e) {
              emit.call(CartFailedState(message: 'Cart Bloc Error'));
            }
          } else {
            emit.call(CartFailedState(message: 'false delete bloc'));
          }
        }
      } catch (e) {
        CartFailedState(message: 'Addition Exception');
      }
    });

    // on<FetchAllPricesSuccessfullyEvent>((event, emit) async {
    //   double sum = 0;
    //   double subTotalPrice = 0;
    //   try {
    //     List<CartProductModel> list =
    //         await productDbProvider.fetchProductFromDb();
    //     for (int i = 0; i < list.length; i++) {
    //       double a = list[i].price!;
    //       sum = sum + a;
    //     }
    //     subTotalPrice = sum;
    //     emit.call(
    //         FetchAllPricesSuccessfullyState(subTotalPrice: subTotalPrice));
    //   } catch (e) {
    //     emit.call(CartFailedState(message: 'Exception of price'));
    //   }
    // });
  }
}
