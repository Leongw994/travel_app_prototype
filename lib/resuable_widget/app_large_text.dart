import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppLargeText extends StatelessWidget {
  int size;
  final String text;
  final Color colour;

  AppLargeText(
      {super.key,
      this.size = 30,
      required this.text,
      this.colour = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(color: colour, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
