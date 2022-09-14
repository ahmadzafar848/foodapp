part of 'home_screen_category_bloc.dart';

@immutable
abstract class HomeScreenCategoryState {}

class HomeScreenCategoryInitialState extends HomeScreenCategoryState {}

class HomeScreenCategoryLoadingState extends HomeScreenCategoryState {}

class HomeScreenCategoryListSuccessfullyLoadedState
    extends HomeScreenCategoryState {
  final List<CategoryModel> list;
  HomeScreenCategoryListSuccessfullyLoadedState({required this.list});
}

class HomeScreenCategoryListFailedState extends HomeScreenCategoryState {
  final String message;
  HomeScreenCategoryListFailedState({required this.message});
}
