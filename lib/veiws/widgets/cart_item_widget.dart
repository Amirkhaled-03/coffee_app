import 'package:coffee_app/constants.dart';
import 'package:coffee_app/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:coffee_app/healpers/show_alert_dalog.dart';

import 'package:coffee_app/models/cart_item_model.dart';
import 'package:coffee_app/veiws/add_or_minus_icon.dart';
import 'package:coffee_app/veiws/customize_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.itemModel,
    required this.index,
  });

  final CartItemModel itemModel;
  final int index;
  static late int price;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      width: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Image.network(
              itemModel.image,
              fit: BoxFit.cover,
              width: 200,
              height: 140,
            ),
            const SizedBox(height: 10),
            Text(
              itemModel.itemName,
              style: const TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              itemModel.itemSize.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    itemModel.numberOfItems--;
                    if (itemModel.numberOfItems == 0) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alertDialog(context);
                        },
                      );
                    } else {
                      if (itemModel.numberOfItems != 0) {
                        BlocProvider.of<AddToCartCubit>(context)
                            .decrementItem(itemModel: itemModel);
                      }
                    }
                  },
                  child: const AddOrMinus(color: kPrimaryColor, char: "-"),
                ),
                Text(
                  "${itemModel.numberOfItems}",
                  style: const TextStyle(fontSize: 20),
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<AddToCartCubit>(context)
                        .incrementItem(itemModel: itemModel);
                  },
                  child: const AddOrMinus(color: kPrimaryColor, char: "+"),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "${itemModel.itemTotalPrice} EGP",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Container(
              height: 40,
              width: double.infinity,
              decoration: const BoxDecoration(color: kPrimaryColor),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return SizedBox(
                            height: MediaQuery.of(context).size.height - 80,
                            child: const CustomizeView());
                      },
                    );
                  },
                  child: const Text(
                    "customize",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ShowAlertDialog alertDialog(BuildContext context) {
    return ShowAlertDialog(
        context: context,
        onPressedAction1: () {
          BlocProvider.of<AddToCartCubit>(context)
              .removeItem(index: index, itemPrice: itemModel.itemPrice);

          Navigator.pop(context);
        },
        onPressedAction2: () {
          BlocProvider.of<AddToCartCubit>(context)
              .replaceItem(index: index, itemPrice: itemModel.itemPrice);

          Navigator.pop(context);
        },
        content: 'remove item from cart?');
  }
}
