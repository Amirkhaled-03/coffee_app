import 'package:coffee_app/constants.dart';
import 'package:coffee_app/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:coffee_app/healpers/show_alert_dalog.dart';
import 'package:coffee_app/healpers/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeliverOrPickup extends StatefulWidget {
  const DeliverOrPickup({
    super.key,
  });

  @override
  State<DeliverOrPickup> createState() => _DeliverOrPickupState();
}

class _DeliverOrPickupState extends State<DeliverOrPickup> {
  int selectedDeliverMethod = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
          color: kSecondaryColor, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () async {
              selectedDeliverMethod = 1;

              setState(() {});

              showSnackBar(context,
                  text: "the order will deliver within 15 min",
                  time: 3,
                  color: Colors.green);

              showDialog(
                  context: context,
                  builder: (context) {
                    return alertDialog(context);
                  });
            },
            child: Container(
              decoration: BoxDecoration(
                color: selectedDeliverMethod == 1
                    ? kPrimaryColor
                    : kSecondaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 160,
              height: 50,
              child: const Center(
                  child: Text(
                "Deliver",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 20),
              )),
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () async {
              selectedDeliverMethod = 2;
              setState(() {});

              showDialog(
                  context: context,
                  builder: (context) {
                    return alertDialog(context);
                  });

              showSnackBar(context,
                  time: 3,
                  text: "scan the qr code in any branch",
                  color: Colors.green);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: selectedDeliverMethod == 2
                      ? kPrimaryColor
                      : kSecondaryColor,
                  borderRadius: BorderRadius.circular(8)),
              width: 160,
              height: 50,
              child: const Center(
                  child: Text(
                "Pick Up",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: 20),
              )),
            ),
          ),
        ],
      ),
    );
  }

  ShowAlertDialog alertDialog(BuildContext context) {
    return ShowAlertDialog(
        context: context,
        noColor: Colors.grey,
        yesColor: Colors.green,
        onPressedAction1: () {
          BlocProvider.of<AddToCartCubit>(context).clearCart();
          Navigator.pop(context);
        },
        onPressedAction2: () {
          Navigator.pop(context);
        },
        content: "confirm the order");
  }
}
