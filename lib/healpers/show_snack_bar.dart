import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context, {
  required String text,
  required Color color,
  required int time,
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 2, top: 2),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    ),
    duration: Duration(seconds: time),
    backgroundColor: color,
    dismissDirection: DismissDirection.horizontal,
    padding: EdgeInsets.zero,
  ));
}
