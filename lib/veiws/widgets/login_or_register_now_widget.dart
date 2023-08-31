import 'package:coffee_app/constants.dart';
import 'package:flutter/material.dart';

class LoginOrRegisterNow extends StatelessWidget {
  const LoginOrRegisterNow(
      {super.key,
      required this.title,
      required this.titleOperation,
      this.onTap});
  final String title, titleOperation;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            titleOperation,
            style: const TextStyle(
                fontSize: 16,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
