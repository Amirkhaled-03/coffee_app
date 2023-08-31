import 'package:coffee_app/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:coffee_app/healpers/show_alert_dalog.dart';
import 'package:coffee_app/veiws/row_payment_data.dart';
import 'package:coffee_app/veiws/widgets/cart_item_widget.dart';
import 'package:coffee_app/veiws/widgets/deliver_or_pick_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';

class CartView extends StatefulWidget {
  const CartView({
    super.key,
  });

  static String id = "CartView";

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  bool isSelected = true;
  int isRadioSelected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 44,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor,
          ),
          title: const Text(
            "cart",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: BlocBuilder<AddToCartCubit, AddToCartState>(
            builder: (context, state) {
          return BlocProvider.of<AddToCartCubit>(context).cart.isEmpty
              ? const Center(
                  child: Text("there is no items start ordering now"))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Your Order",
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  child: const Text("clear"),
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return alertDialog(context);
                                        });
                                  },
                                )
                              ],
                            ),
                            Text(
                              "${BlocProvider.of<AddToCartCubit>(context).cart.length}",
                              style: const TextStyle(color: kSecondaryColor),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 326,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: BlocProvider.of<AddToCartCubit>(context)
                              .cart
                              .length,
                          itemBuilder: (context, index) {
                            return CartItemWidget(
                              index: index,
                              itemModel:
                                  BlocProvider.of<AddToCartCubit>(context)
                                      .cart[index],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16, bottom: 60, left: 12, right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Add Promo Code",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            const TextField(
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kPrimaryColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: kPrimaryColor),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  hintText: "Add Promo Code"),
                            ),
                            const SizedBox(height: 20),
                            RowPaymentData(
                                title: "Sub Total",
                                price: BlocProvider.of<AddToCartCubit>(context)
                                    .totalPayment
                                    .toStringAsFixed(2)),
                            const SizedBox(height: 8),
                            RowPaymentData(title: "Tax", price: tax.toString()),
                            const SizedBox(height: 8),
                            const Divider(
                              indent: 0,
                              endIndent: 300,
                              // color: Colors.black,
                            ),
                            const SizedBox(height: 8),
                            RowPaymentData(
                                title: "Grand Total",
                                price:
                                    "payment ${(BlocProvider.of<AddToCartCubit>(context).totalPayment + tax).toStringAsFixed(2)}"),
                            const SizedBox(height: 8),
                            const Divider(
                                // color: Colors.black,
                                ),
                            const Text(
                              "Select Payment Method",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),

                            RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              activeColor: kPrimaryColor,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cash Payment",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isRadioSelected == 1
                                            ? kPrimaryColor
                                            : Colors.black),
                                  ),
                                  Text(
                                      "payment : ${(BlocProvider.of<AddToCartCubit>(context).totalPayment + tax).toStringAsFixed(2)}"),
                                ],
                              ),
                              value: 1,
                              groupValue: isRadioSelected,
                              onChanged: (v) {
                                setState(() {
                                  isRadioSelected = v!;
                                });
                              },
                            ),

                            RadioListTile(
                              contentPadding: EdgeInsets.zero,
                              activeColor: kPrimaryColor,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Credit Card",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isRadioSelected == 2
                                            ? kPrimaryColor
                                            : Colors.black),
                                  ),
                                  Text(
                                    "payment : ${(BlocProvider.of<AddToCartCubit>(context).totalPayment + tax).toStringAsFixed(2)}",
                                  ),
                                ],
                              ),
                              value: 2,
                              groupValue: isRadioSelected,
                              onChanged: (v) {
                                setState(() {
                                  isRadioSelected = v!;
                                });
                              },
                            ),

                            const SizedBox(height: 30),
                            const DeliverOrPickup()
                            // Theme(
                            //   data: Theme.of(context).copyWith(
                            //       unselectedWidgetColor: Colors.green,
                            //       disabledColor: Colors.green),
                            //   child: RadioListTile(
                            //     title: const Text("Credit Card"),
                            //     value: 1,
                            //     groupValue: 1,
                            //     onChanged: (v) {
                            //       // setState(() {
                            //       //   _isRadioSelected = v;
                            //       // });
                            //     },
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
        }));
  }

  ShowAlertDialog alertDialog(BuildContext context) {
    return ShowAlertDialog(
      context: context,
      content: "remove all cart items?",
      onPressedAction1: () {
        BlocProvider.of<AddToCartCubit>(context).clearCart();
        Navigator.pop(context);
      },
      onPressedAction2: () {
        Navigator.pop(context);
      },
    );
  }
}
