part of 'add_to_cart_cubit.dart';

// @immutable
sealed class AddToCartState {}

final class AddToCartInitial extends AddToCartState {}

final class SuccessAddToCart extends AddToCartState {
  final String successMessage = "item added to cart";
}

final class SuccessChangesInItemCount extends AddToCartState {}
final class CartClear extends AddToCartState {}
