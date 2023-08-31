import 'package:coffee_app/constants.dart';
import 'package:coffee_app/cubits/favorites/favorites_cubit.dart';
import 'package:coffee_app/healpers/show_snack_bar.dart';
import 'package:coffee_app/models/item_model.dart';
import 'package:coffee_app/veiws/widgets/custom_text_field.dart';
import 'package:coffee_app/veiws/widgets/categories_list_veiw.dart';
import 'package:coffee_app/veiws/widgets/item_card.dart';
import 'package:coffee_app/veiws/widgets/home_page_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/categories_cubit/categories_item_cubit.dart';

class HomeVeiw extends StatelessWidget {
  const HomeVeiw({
    super.key,
  });
  static String id = "HomePage";
  @override
  Widget build(BuildContext context) {
    List<ItemModel> categoryItem = [];
    bool isLoading = false;

    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomePageHeader(),
                CustomTextField(hint: "Search Coffee", icon: Icons.search),
                SizedBox(height: 18),
                Text(
                  "Categories",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kTertiaryColor),
                ),
              ],
            ),
          ),
          const CategortListVeiw(),
          Expanded(
            child: BlocConsumer<CategoriesItemCubit, CategoriesItemState>(
              listener: (context, state) {
                if (state is LoadingState) {
                  isLoading = true;
                }
                if (state is SuccessState) {
                  categoryItem = BlocProvider.of<CategoriesItemCubit>(context)
                      .itemsCategory;
                  isLoading = false;
                }
                if (state is FailureState) {
                  showSnackBar(context,text: state.errMessage,color: Colors.grey,time: 1);
                }
              },
              builder: (context, state) {
                return isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : BlocBuilder<FavoritesCubit, FavoritesState>(
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 40,
                              left: 8,
                              right: 8,
                            ),
                            child: GridView.builder(
                                padding: const EdgeInsets.only(bottom: 20),
                                itemCount: categoryItem.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.68,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                ),
                                itemBuilder: (context, index) {
                                  return Builder(
                                    builder: (context) {
                                      return ItemCard(
                                        itemModel: categoryItem[index],
                                      );
                                    },
                                  );
                                }),
                          );
                        },
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
