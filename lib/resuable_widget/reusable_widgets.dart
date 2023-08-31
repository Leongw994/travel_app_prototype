import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 150,
    height: 150,
    color: Colors.white,
  );
}

Image blackLogoWidget(String name) {
  return Image.asset(
    name,
    fit: BoxFit.fitWidth,
    width: 100,
    height: 100,
    color: Color.fromARGB(255, 7, 97, 128),
  );
}
