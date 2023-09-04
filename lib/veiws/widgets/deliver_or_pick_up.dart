import 'package:coffee_app/constants.dart';
import 'package:coffee_app/veiws/widgets/confirm_order_dialog.dart';
import 'package:flutter/material.dart';

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

              showDialog(
                  context: context,
                  builder: (context) {
                    return const ConfirmOrderingDialog(
                      content: "the order will deliver within 15 min",
                    );
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
                    return const ConfirmOrderingDialog(
                      content: "scan the qr code in any branch",
                    );
                  });
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
}
