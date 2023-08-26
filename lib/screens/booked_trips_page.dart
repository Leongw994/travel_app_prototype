import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/color_utils/colors.dart';
import 'package:travelapp/models/locations.dart';
import 'package:travelapp/resuable_widget/cart.dart';

class BookedTripPage extends StatelessWidget {
  const BookedTripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                title: Text('Booked trips'),
                backgroundColor: hexStringToColor('00E5FF'),
              ),
              body: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    //get trip from the shopping list
                    final Location location = value.cart[index];
                    //get trip name
                    final String tripName = location.name;
                    //get trip price
                    final String tripPrice = location.price;
                    //return list tile
                    return ListTile(
                      title: Text(tripName),
                      subtitle: Text(tripPrice),
                    );
                  }),
            ));
  }
}
