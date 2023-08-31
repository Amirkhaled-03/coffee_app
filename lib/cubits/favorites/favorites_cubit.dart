import 'package:bloc/bloc.dart';
import 'package:coffee_app/models/item_model.dart';
// import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());

  List<ItemModel> favoriteItems = [];
  void addToFavorite({required ItemModel item}) {
    favoriteItems.add(item);
    emit(SuccessAddState());
  }

  void removeFromFavorite({required int index}) {
    favoriteItems.removeAt(index);
    emit(SuccessRemoveState());
  }
}
