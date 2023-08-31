import 'package:coffee_app/constants.dart';
import 'package:flutter/material.dart';

class CategoryName extends StatelessWidget {
  const CategoryName(
      {super.key, required this.index, required this.isSelected});

  final int index;
  final bool isSelected;
  final List<String> titles = const [
    "Hot Coffees",
    "Frappess",
    "Iced Coffee",
    "Juices",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 5,
        top: 10,
        bottom: 10,
      ),
      width: 150,
      height: 450,
      child: Card(
        surfaceTintColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        shadowColor: Colors.grey,
        color: isSelected ? kTertiaryColor : Colors.grey,
        elevation: 5,
        child: Center(
          child: Text(
            titles[index],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
