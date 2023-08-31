import 'package:coffee_app/constants.dart';
import 'package:coffee_app/cubits/favorites/favorites_cubit.dart';
import 'package:coffee_app/veiws/widgets/favorite_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteVeiw extends StatelessWidget {
  const FavoriteVeiw({super.key});
  static String id = "FavoriteVeiw";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leadingWidth: 44,
            elevation: 2,
            backgroundColor: Colors.white,
            leading: const Icon(
              Icons.arrow_back_ios,
              color: kTertiaryColor,
            ),
            title: const Text(
              "Favorites",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: BlocProvider.of<FavoritesCubit>(context).favoriteItems.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("Assets/photos/Favorites.png"),
                      const Text(
                        "No Favorites",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'You can add an item to your',
                        style: TextStyle(fontSize: 15),
                      ),
                      const Text(
                        'favorites by clicking "Heart Icon"',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  itemCount: BlocProvider.of<FavoritesCubit>(context)
                      .favoriteItems
                      .length,
                  itemBuilder: (context, index) {
                    return FavoritesItemsWidget(
                      item: BlocProvider.of<FavoritesCubit>(context)
                          .favoriteItems[index],
                      onPressed: () {
                        BlocProvider.of<FavoritesCubit>(context)
                            .removeFromFavorite(index: index);
                      },
                    );
                  }),
        );
      },
    );
  }
}
