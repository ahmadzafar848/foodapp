import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/category_model.dart';
import '../../../utils/api_service/api_service.dart';

part 'home_screen_category_event.dart';
part 'home_screen_category_state.dart';

class HomeScreenCategoryBloc
    extends Bloc<HomeScreenCategoryEvent, HomeScreenCategoryState> {
  ApiService apiService = ApiService();
  HomeScreenCategoryBloc() : super(HomeScreenCategoryInitialState()) {
    on<HomeScreenCategoryFetchCategoryListSuccessfullyEvent>(
        (event, emit) async {
      emit.call(HomeScreenCategoryLoadingState());
      try {
        List<CategoryModel> list = await apiService.getCategoryList();
        emit.call(HomeScreenCategoryListSuccessfullyLoadedState(list: list));
      } catch (e) {
        emit.call(HomeScreenCategoryListFailedState(message: e.toString()));
      }
    });
  }
}
