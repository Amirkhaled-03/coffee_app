import 'package:flutter/material.dart';

import '../../models/item_model.dart';

class FavoritesItemsWidget extends StatelessWidget {
  const FavoritesItemsWidget({
    super.key,
    required this.item,
    this.onPressed,
  });

  final ItemModel item;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      // color: Colors.red,
      height: 80,
      child: Card(
        clipBehavior: Clip.hardEdge,
        shadowColor: Colors.grey,
        elevation: 2,
        // color: Colors.red,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              item.image,
              fit: BoxFit.fitWidth,
              width: 78,
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.itemName,
                  style: const TextStyle(
                      color: Color(0xff633E27), fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 7),
                Text(
                  item.description,
                  style: const TextStyle(color: Color(0xff5C5C5C)),
                )
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.favorite,
                  color: Color(0xffAD381F),
                ))
          ],
        ),
      ),
    );
  }
}
