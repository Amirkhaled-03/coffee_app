import 'package:flutter/material.dart';

class ShowAlertDialog extends StatelessWidget {
  const ShowAlertDialog({
    super.key,
    required this.context,
    required this.onPressedAction1,
    required this.onPressedAction2,
    required this.content,
    this.yesColor,
    this.noColor,
  });

  final BuildContext context;
  final String content;

  final void Function() onPressedAction1;
  final void Function() onPressedAction2;
  final Color? yesColor, noColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(content),
      actions: [
        TextButton(
            onPressed: onPressedAction1,
            child: Text(
              "Yes",
              style: TextStyle(color: yesColor ?? Colors.grey),
            )),
        TextButton(
            onPressed: onPressedAction2,
            child: Text(
              "No",
              style: TextStyle(color: noColor ?? Colors.green),
            )),
      ],
    );
  }
}
