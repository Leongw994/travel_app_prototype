import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const Button({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.greenAccent, borderRadius: BorderRadius.circular(40)),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            //text
            Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }
}
