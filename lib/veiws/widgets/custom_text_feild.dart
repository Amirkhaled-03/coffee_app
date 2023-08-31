import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../cubits/add_to_cart/add_to_cart_cubit.dart';
import '../add_or_minus_icon.dart';

class CustomizeTextField extends StatelessWidget {
  const CustomizeTextField(
      {super.key, required this.title, required this.index});
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToCartCubit, AddToCartState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: SizedBox(
                  width: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          "+${BlocProvider.of<AddToCartCubit>(context).assignPrice(index)} EGP"),
                      AddOrMinus(
                          color: kPrimaryColor,
                          char: '-',
                          onTap: () {
                            BlocProvider.of<AddToCartCubit>(context)
                                .decrementExtrasItem(index);
                          }),
                      Text(
                        "${BlocProvider.of<AddToCartCubit>(context).extras[index]}",
                      ),
                      AddOrMinus(
                          color: kPrimaryColor,
                          char: "+",
                          onTap: () {
                            BlocProvider.of<AddToCartCubit>(context)
                                .incrementExtrasItem(index);
                          }),
                    ],
                  ),
                ),
                labelText: "Extras",
                labelStyle: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                hintText: title,
                hintStyle: const TextStyle(
                    fontSize: 15,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold),
                border: borderDecoration(),
                focusedBorder: borderDecoration(),
                enabledBorder: borderDecoration()),
          ),
        );
      },
    );
  }

  OutlineInputBorder borderDecoration() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: kPrimaryColor));
  }
}
