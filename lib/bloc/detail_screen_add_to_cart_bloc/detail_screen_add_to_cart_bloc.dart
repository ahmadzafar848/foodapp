import 'package:bloc/bloc.dart';
import 'package:meher_kitchen/models/cart_product_model.dart';
import 'package:meher_kitchen/utils/local_database/product_db_provider.dart';
import 'package:meta/meta.dart';

part 'detail_screen_add_to_cart_event.dart';
part 'detail_screen_add_to_cart_state.dart';

class DetailScreenAddToCartBloc
    extends Bloc<DetailScreenAddToCartEvent, DetailScreenAddToCartState> {
  ProductDbProvider productDbProvider = ProductDbProvider();
  DetailScreenAddToCartBloc() : super(DetailScreenAddToCartInitialState()) {
    on<DetailScreenAddToCartInitialEvent>((event, emit) {
      emit.call(DetailScreenAddToCartInitialState());
    });

    on<DetailScreenAddToCartSuccessfullyEvent>((event, emit) async {
      CartProductModel cartProductModel = event.cartProductModel;
      try {
        bool result = await productDbProvider.insertProduct(cartProductModel);
        if (result) {
          emit.call(
              DetailScreenAddToCartSuccessfullyState(message: 'Added To Cart'));
        } else {
          emit.call(DetailScreenAddToCartFailedState(message: 'Sorry'));
        }
      } catch (e) {
        emit.call(DetailScreenAddToCartFailedState(
            message: 'You have already added this product in cart'));
      }
    });
  }
}
