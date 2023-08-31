import 'package:flutter/material.dart';

class AddOrMinus extends StatelessWidget {
  const AddOrMinus({
    super.key,
    required this.char,
    this.onTap, required this.color,
  });
  final String char;
  final void Function()? onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            char,
            style: const TextStyle(
              fontSize: 29,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
