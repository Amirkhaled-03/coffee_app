import 'package:flutter/material.dart';

class CustomCardIcon extends StatelessWidget {
  const CustomCardIcon({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Card(
        color: Colors.white,
        elevation: 2,
        surfaceTintColor: Colors.grey,
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Image.asset(
              image,
            ),
          ),
          onTap: () {},
        ),
        // child: IconButton(
        //     padding: EdgeInsets.zero,
        //     onPressed: () {},
        //     icon: Icon(
        //       icon,
        //       // color: Color(0xff3b5998),
        //       // color: kPrimaryColor,
        //       size: 40,
        //     )),
      ),
    );
  }
}
