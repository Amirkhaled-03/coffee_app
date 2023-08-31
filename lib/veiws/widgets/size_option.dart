import 'package:coffee_app/constants.dart';
import 'package:flutter/material.dart';

class SizeOption extends StatelessWidget {
  const SizeOption({
    super.key,
    required this.image,
    required this.size,
    required this.isSelected,
  });

  final String size, image;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 44,
          decoration: BoxDecoration(
              color: isSelected
                  ? kSecondaryColor.withOpacity(.4)
                  : Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              Text(
                size,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
