import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  final String text;
  const MyTile({super.key, required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        onTap: onTap,
        title: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
