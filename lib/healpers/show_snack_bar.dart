import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context, {
  required String text,
  required Color color,
  required int time,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    duration: Duration(seconds: time),
    backgroundColor: color,
    dismissDirection: DismissDirection.horizontal,
    padding: EdgeInsets.zero,
  ));
}
