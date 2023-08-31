import 'package:coffee_app/constants.dart';
import 'package:coffee_app/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:coffee_app/veiws/widgets/custom_button.dart';
import 'package:coffee_app/veiws/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomizeView extends StatelessWidget {
  const CustomizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Customize",
                  style: TextStyle(
                      color: kTertiaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            const CustomizeTextField(index: 0, title: "Vanilla Flavor"),
            const CustomizeTextField(title: "Espresso shot", index: 1),
            const CustomizeTextField(title: "Caramel Flavor", index: 2),
            const CustomizeTextField(
                title: "Suger Free Vanila Flavor", index: 3),
            const CustomizeTextField(
                title: "Suger Free Caramel Flavor", index: 4),
            const CustomizeTextField(
                title: "Suger Free Hazelnut Flavor", index: 5),
            const CustomizeTextField(title: "platinum Espresso Shot", index: 6),
            const CustomizeTextField(title: "Glass Of Milk", index: 7),
            const CustomizeTextField(title: "Honey", index: 8),
            CustomButton(
                color: kPrimaryColor,
                title: "Done",
                onTap: () {
                  BlocProvider.of<AddToCartCubit>(context)
                      .extras
                      .fillRange(0, 9, 0);
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
