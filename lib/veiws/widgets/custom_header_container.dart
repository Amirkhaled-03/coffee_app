import 'package:coffee_app/constants.dart';
import 'package:coffee_app/veiws/widgets/hearder_widget.dart';
import 'package:flutter/material.dart';

class CustomHeaderContainer extends StatelessWidget {
  const CustomHeaderContainer({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 207,
          decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(200))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: HeaderWidget(
            title: title,
          ),
        ),
      ],
    );
  }
}
