import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../api_service/api_service.dart';
import '../../../models/product_by_id_model.dart';
import '../../../models/product_list_model.dart';

part 'home_screen_product_event.dart';
part 'home_screen_product_state.dart';

class HomeScreenProductBloc
    extends Bloc<HomeScreenProductEvent, HomeScreenProductState> {
  ApiService apiService = ApiService();
  HomeScreenProductBloc() : super(HomeScreenProductInitialState()) {
    on<HomeScreenCategoryFetchCategoryByIdSuccessfullyEvent>(
        (event, emit) async {
      emit.call(HomeScreenProductLoadingState());
      if (event.categoryId == 0) {
        try {
          List<ProductByIdModel> list = await apiService.getProductList();
          emit.call(HomeScreenCategoryByIdState(list: list));
        } catch (e) {
          emit.call(HomeScreenProductListFailedState(message: e.toString()));
        }
      } else {
        try {
          List<ProductByIdModel> list =
              await apiService.getProductById(event.categoryId);
          if (list.isNotEmpty) {
            emit.call(HomeScreenCategoryByIdState(list: list));
          } else {
            emit.call(HomeScreenEmptyListState());
          }
        } catch (e) {
          emit.call(HomeScreenProductListFailedState(message: e.toString()));
        }
      }
    });
  }
}
