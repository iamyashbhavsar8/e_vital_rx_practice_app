import 'package:flutter/material.dart';

void showSnackBar(
  String msg,
  BuildContext context, {
  Color color = const Color(0xFF14A9FE),
  Color fontColor = const Color(0xFFFFFFFF),
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: TextStyle(color: fontColor),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
    ),
  );
}

String uppercase(String value) {
  var result = value.toUpperCase();
  return result;
}
