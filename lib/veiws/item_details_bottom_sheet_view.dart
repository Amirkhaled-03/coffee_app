import 'package:coffee_app/constants.dart';
import 'package:coffee_app/cubits/increment_or_decrement/increment_or_decrement_cubit.dart';
import 'package:coffee_app/healpers/show_snack_bar.dart';
import 'package:coffee_app/models/cart_item_model.dart';
import 'package:coffee_app/models/item_model.dart';
import 'package:coffee_app/veiws/widgets/custom_button.dart';
import 'package:coffee_app/veiws/widgets/size_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_to_cart/add_to_cart_cubit.dart';
import 'add_or_minus_icon.dart';

class ItemDetailsBottomSheet extends StatefulWidget {
  const ItemDetailsBottomSheet({
    super.key,
    required this.itemModel,
  });
  final ItemModel itemModel;

  @override
  State<ItemDetailsBottomSheet> createState() => _ItemDetailsBottomSheetState();
}

class _ItemDetailsBottomSheetState extends State<ItemDetailsBottomSheet> {
  int selectedSize = 2;
  String size = "medium";

  late int price = widget.itemModel.medium;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IncrementOrDecrementCubit(itemsPrice: price),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          // height: 1000,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24)),
          ),

          child: Padding(
            padding: const EdgeInsets.all(16),
            child: BlocBuilder<IncrementOrDecrementCubit,
                IncrementOrDecrementState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.itemModel.itemName,
                      style: const TextStyle(
                          letterSpacing: 1.7,
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.itemModel.description,
                      style: const TextStyle(
                        color: kSecondaryColor,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.info_outline,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Size Options",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            selectedSize = 1;
                            price = widget.itemModel.small;
                            BlocProvider.of<IncrementOrDecrementCubit>(context)
                                .itemsPrice = price;
                            BlocProvider.of<IncrementOrDecrementCubit>(context)
                                .itemsNumber = 1;
                            size = "small";
                            BlocProvider.of<AddToCartCubit>(context).price =
                                price;

                            setState(() {});
                          },
                          child: SizeOption(
                            image: "Assets/photos/small size cup.png",
                            size: "250",
                            isSelected: selectedSize == 1,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            selectedSize = 2;
                            price = widget.itemModel.medium;
                            BlocProvider.of<IncrementOrDecrementCubit>(context)
                                .itemsPrice = price;
                            BlocProvider.of<IncrementOrDecrementCubit>(context)
                                .itemsNumber = 1;
                            size = "medium";
                            BlocProvider.of<AddToCartCubit>(context).price =
                                price;

                            setState(() {});
                          },
                          child: SizeOption(
                            image: "Assets/photos/medium size cap.png",
                            size: "350",
                            isSelected: selectedSize == 2,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            selectedSize = 3;
                            price = widget.itemModel.large;
                            BlocProvider.of<IncrementOrDecrementCubit>(context)
                                .itemsPrice = price;
                            BlocProvider.of<IncrementOrDecrementCubit>(context)
                                .itemsNumber = 1;
                            size = "large";
                            BlocProvider.of<AddToCartCubit>(context).price =
                                price;
                            setState(() {});
                          },
                          child: SizeOption(
                            image: "Assets/photos/large size cub.png",
                            size: "450",
                            isSelected: selectedSize == 3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        AddOrMinus(
                          color: Colors.white.withOpacity(.4),
                          char: '-',
                          onTap: () {
                            BlocProvider.of<IncrementOrDecrementCubit>(context)
                                .incrementOrDecrement(price: -price);
                          },
                        ),
                        const SizedBox(width: 30),
                        Text(
                          "${BlocProvider.of<IncrementOrDecrementCubit>(context).itemsNumber}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(width: 30),
                        AddOrMinus(
                          color: Colors.white.withOpacity(.4),
                          char: '+',
                          onTap: () {
                            BlocProvider.of<IncrementOrDecrementCubit>(context)
                                .incrementOrDecrement(price: price);
                          },
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Text(
                              "${BlocProvider.of<IncrementOrDecrementCubit>(context).itemsPrice}",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20),
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
                      ],
                    ),
                    const Spacer(),
                    CustomButton(
                      color: kSecondaryColor.withOpacity(.2),
                      title: "Add to cart",
                      onTap: () {
                        BlocProvider.of<AddToCartCubit>(context).addToCart(
                            item: CartItemModel(
                                itemName: widget.itemModel.itemName,
                                image: widget.itemModel.image,
                                numberOfItems:
                                    BlocProvider.of<IncrementOrDecrementCubit>(
                                            context)
                                        .itemsNumber,
                                itemSize: size,
                                itemPrice: price,
                                itemTotalPrice:
                                    BlocProvider.of<IncrementOrDecrementCubit>(
                                            context)
                                        .itemsPrice));

                        BlocProvider.of<AddToCartCubit>(context).totalPayment +=
                            BlocProvider.of<IncrementOrDecrementCubit>(context)
                                .itemsPrice
                                .toDouble();
                        showSnackBar(context,
                            text: "successfully added to cart",
                            time: 1,
                            color: Colors.green);
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
