import 'package:flutter/cupertino.dart';

import '../constants.dart';

class RowPaymentData extends StatelessWidget {
  const RowPaymentData({
    super.key,
    required this.title,
    required this.price,
  });
  final String title, price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: kPrimaryColor, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Text(
              price,
              style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              " EGP",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 14,
              ),
            )
          ],
        ),
      ],
    );
  }
}
