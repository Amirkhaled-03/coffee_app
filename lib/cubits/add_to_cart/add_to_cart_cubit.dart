import 'package:bloc/bloc.dart';
import 'package:coffee_app/models/cart_item_model.dart';
// import 'package:meta/meta.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartInitial());

  List<CartItemModel> cart = [];
  List<int> extras = [1, 1, 1, 1, 1, 1, 1, 1, 1];

  double totalPayment = 0.0;
  int price = 0;

  void addToCart({required CartItemModel item}) {
    cart.add(item);
    emit(SuccessAddToCart());
  }

  void incrementItem({required CartItemModel itemModel}) {
    totalPayment += itemModel.itemPrice;

    itemModel.numberOfItems++;

    itemModel.itemTotalPrice += itemModel.itemPrice;
    emit(SuccessChangesInItemCount());
  }

  void decrementItem({required CartItemModel itemModel}) {
    totalPayment -= itemModel.itemPrice;

    itemModel.itemTotalPrice -= itemModel.itemPrice;

    emit(SuccessChangesInItemCount());
  }

  void clearCart() {
    cart.clear();
    totalPayment = 0;
    emit(CartClear());
  }

  void removeItem({required int index, required int itemPrice}) {
    cart.removeAt(index);
    totalPayment -= itemPrice;

    emit(SuccessChangesInItemCount());
  }

  void replaceItem({required int index, required int itemPrice}) {
    cart[index].itemTotalPrice = itemPrice;
    cart[index].numberOfItems = 1;

    emit(SuccessChangesInItemCount());
  }

  void decrementExtrasItem(int index) {
    extras[index]--;
    if (extras[index] < 0) {
      extras[index] = 0;
    }
    totalPayment -= 15.4;

    emit(SuccessChangesInItemCount());
  }

  void incrementExtrasItem(int index) {
    extras[index]++;
    totalPayment += 15.4;

    emit(SuccessChangesInItemCount());
  }

  double assignPrice(int index) {
    return (extras[index] == 0) ? 15.4 : 15.4 * extras[index];
  }
}
