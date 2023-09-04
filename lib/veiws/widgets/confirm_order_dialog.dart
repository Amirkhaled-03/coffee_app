import 'package:coffee_app/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmOrderingDialog extends StatelessWidget {
  const ConfirmOrderingDialog({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // actionsPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Thank you for ordering!",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(content),
        ],
      ),
      title: Image.asset(
        "Assets/photos/success ordaring.png",
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Continue ordering")),
        TextButton(
            onPressed: () {
              BlocProvider.of<AddToCartCubit>(context).clearCart();
              Navigator.pop(context);
            },
            child: const Text("Close")),
      ],
    );
  }
}