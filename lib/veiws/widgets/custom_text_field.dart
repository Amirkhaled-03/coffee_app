import 'package:coffee_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
  });
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hint,
          hintStyle: const TextStyle(color: kPrimaryColor),
          focusedBorder: borderStyle(),
          enabledBorder: borderStyle(),
        ),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return const OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor),
        borderRadius: BorderRadius.all(Radius.circular(30)));
  }
}
