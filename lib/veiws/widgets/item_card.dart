import 'package:coffee_app/constants.dart';
import 'package:coffee_app/cubits/favorites/favorites_cubit.dart';
import 'package:coffee_app/models/item_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../item_details_bottom_sheet_view.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              Image.network(
                widget.itemModel.image,
                height: 150,
                width: 300,
                fit: BoxFit.fill,
              ),
              IconButton(
                  onPressed: () {
                    if (isFavorite == true) {
                      isFavorite = false;
                    } else {
                      isFavorite = true;
                      BlocProvider.of<FavoritesCubit>(context)
                          .addToFavorite(item: widget.itemModel);
                    }
                  },
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: isFavorite ? Colors.red : Colors.white,
                    size: 30,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemModel.itemName,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 21),
                ),
                Text(
                  widget.itemModel.description,
                  style: const TextStyle(
                    color: kSecondaryColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${widget.itemModel.medium} ",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "EGP",
                          style: TextStyle(
                            // fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24))),
                            context: context,
                            builder: (context) {
                              return ItemDetailsBottomSheet(
                                itemModel: widget.itemModel,
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.add_box,
                          color: Colors.white,
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
