import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_app/models/item_model.dart';

part 'categories_item_state.dart';

class CategoriesItemCubit extends Cubit<CategoriesItemState> {
  CategoriesItemCubit() : super(CategoriesItemInitial());
  List<String> collections = [
    "hotCoffeeCategory",
    "frappesCategory",
    "icedCoffee",
    "Juices"
  ];
  // late CollectionReference hotCoffeeCategory =
  //     FirebaseFirestore.instance.collection(collections[0]!);
  List<ItemModel> itemsCategory = [];
  List<ItemModel> favoriteItems = [];
  Future getAllItems({required int index}) async {
    try {
      emit(LoadingState());
      itemsCategory.clear();
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(collections[index]).get();
      for (int i = 0; i < querySnapshot.docs.length; i++) {
        itemsCategory.add(ItemModel.fromJson(querySnapshot.docs[i]));
      }
      emit(SuccessState());
    } on Exception catch (e) {
      emit(FailureState(errMessage: e.toString()));
    }
  }
}
