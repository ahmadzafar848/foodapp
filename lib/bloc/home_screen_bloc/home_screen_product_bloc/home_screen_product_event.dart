part of 'home_screen_product_bloc.dart';

@immutable
abstract class HomeScreenProductEvent {}

class HomeScreenFetchProductListSuccessfullyEvent
    extends HomeScreenProductEvent {}

//iss ko agay ly k chlo
class HomeScreenCategoryFetchCategoryByIdSuccessfullyEvent
    extends HomeScreenProductEvent {
  final int categoryId;
  HomeScreenCategoryFetchCategoryByIdSuccessfullyEvent(
      {required this.categoryId});
}
