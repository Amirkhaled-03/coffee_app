import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

part 'increment_or_decrement_state.dart';

class IncrementOrDecrementCubit extends Cubit<IncrementOrDecrementState> {
  IncrementOrDecrementCubit({required this.itemsPrice})
      : super(IncrementOrDecrementInitial());
  late int itemsPrice;
  int itemsNumber = 1;
  void incrementOrDecrement({required int price}) {
    itemsPrice += price;
    price > 0 ? itemsNumber++ : itemsNumber--;
    if (itemsNumber == 0) {
      itemsNumber = 1;
      itemsPrice = -price;
    }
    emit(IncrementSuccess());
  }
}
