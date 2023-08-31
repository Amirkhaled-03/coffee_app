import 'package:coffee_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.onChanged,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });
  final String label;
  final void Function(String) onChanged;
  final bool obscureText;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        cursorColor: kPrimaryColor,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "this field is required";
          }
          return null;
        },
        onChanged: onChanged,
        decoration: InputDecoration(
            label: Text(label),
            labelStyle: const TextStyle(color: kPrimaryColor, fontSize: 19),
            border: borderDecoration(),
            enabledBorder: borderDecoration(),
            focusedBorder: borderDecoration()),
      ),
    );
  }

  OutlineInputBorder borderDecoration() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: kPrimaryColor),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
