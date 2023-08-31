import 'package:flutter/material.dart';
import 'package:travelapp/models/locations.dart';

class Shop extends ChangeNotifier {
  final List<Location> _locationList = [
    Location(
        name: "Lace Market",
        price: "21.00",
        imagePath: "images/centre.jpg",
        location: "Nottingham, UK",
        description:
            "The Lace Market Theatre is a well-known community theatre located in Nottingham, England. It is situated in the historic Lace Market area of the city, which is known for its connection to the lace industry of the 19th century. The theatre is operated and run by volunteers and is focused on providing high-quality amateur theatre productions to the local community and beyond. Book a ticket today to see one of our plays today!"),
    Location(
        name: "Notts Castle",
        price: "16.00",
        imagePath: "images/history.jpeg",
        location: "Nottingham, UK",
        description:
            "A historic fortress situated on a prominent hill in the city of Nottingham, England, built in 1062 AD. Its rich history spans over a thousand years and has played a significant role in the region's development. Originally constructed as a wooden fortress in the 11th century by William the Conqueror, the castle evolved over time and eventually became a symbol of power, governance, and cultural heritage."),
    Location(
        name: "Jerusalem Inn",
        price: "11.00",
        imagePath: "images/jerusalem.jpg",
        location: "Nottingham, UK",
        description:
            "As England's oldest inn, the pub is nestled beneath the cliff on which Nottingham's historic castle stands, and was once a well-known pit stop for crusader knights. It is said that King Richard the Lionheart and his men are more than likely to have gathered at this historic royal dwelling before journeying to Jerusalem in 1189AD, thus giving the pub its unusual name."),
    Location(
        name: "Justice Museum",
        price: "12.05",
        imagePath: "images/museum.jpg.webp",
        location: "Nottingham, UK",
        description:
            "The National Justice Museum in Nottingham is a unique and engaging institution that offers visitors a captivating journey into the world of justice, law enforcement, and punishment. Housed within the historic Shire Hall and County Gaol buildings, the museum provides a thought-provoking exploration of legal history through interactive exhibitions, immersive displays, and engaging storytelling. It sheds light on significant legal cases, the evolution of the justice system, and the experiences of both the accused and the enforcers of the law."),
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
