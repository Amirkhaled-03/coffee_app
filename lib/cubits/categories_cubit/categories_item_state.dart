part of 'categories_item_cubit.dart';

abstract class CategoriesItemState {}

final class CategoriesItemInitial extends CategoriesItemState {}

final class LoadingState extends CategoriesItemState {}

final class SuccessState extends CategoriesItemState {}

final class FailureState extends CategoriesItemState {
  final String errMessage;
  FailureState({required this.errMessage});
}
