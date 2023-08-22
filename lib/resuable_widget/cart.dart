import 'package:flutter/material.dart';
import 'package:travelapp/models/locations.dart';

class Shop extends ChangeNotifier {
  final List<Location> _locationList = [
    Location(
        name: "Lace Market",
        price: "21.00",
        imagePath: "images/centre.jpg",
        location: "Nottingham, UK"),
    Location(
        name: "Nottingham Castle",
        price: "16.00",
        imagePath: "images/history.jpeg",
        location: "Nottingham, UK"),
    Location(
        name: "Ye Olde Trip to Jerusalem",
        price: "11.00",
        imagePath: "images/jerusalem.jpg",
        location: "Nottingham, UK"),
    Location(
        name: "National Justice Museum",
        price: "17.00",
        imagePath: "images/museum.jpg.webp",
        location: "Nottingham, UK"),
  ];

  //user cart
  List<Location> _cart = [];

  //getter methods
  List<Location> get locationList => _locationList;
  List<Location> get cart => _cart;

  //add to cart
  void addToBasket(Location trip, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(trip);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromBasket(Location trip) {
    _cart.remove(trip);
    notifyListeners();
  }
}
