import 'package:coffee_app/constants.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 28),
        Card(
          color: Colors.white,
          child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.black,
                size: 30,
              )),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: kSecondaryColor),
        ),
      ],
    );
  }
}
