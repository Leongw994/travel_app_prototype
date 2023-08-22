import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color colour;

  AppText(
      {super.key,
      this.size = 12,
      required this.text,
      this.colour = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: colour, fontSize: size),
    );
  }
}
