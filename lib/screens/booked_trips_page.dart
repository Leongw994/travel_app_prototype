import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/color_utils/colors.dart';
import 'package:travelapp/models/locations.dart';
import 'package:travelapp/resuable_widget/button.dart';
import 'package:travelapp/resuable_widget/cart.dart';

class BookedTripPage extends StatelessWidget {
  const BookedTripPage({super.key});

  //cancel trip function
  void cancelTrip(Location location, BuildContext context) {
    final shop = context.read<Shop>();
    //remove the trip from the cart
    shop.removeFromBasket(location);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                title: Text('Booked trips'),
                backgroundColor: hexStringToColor('00E5FF'),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.cart.length,
                        itemBuilder: (context, index) {
                          //get trip from the shopping list
                          final Location location = value.cart[index];
                          //get trip name
                          final String tripName = location.name;
                          //get trip price
                          final String tripPrice = location.price;
                          //return list tile
                          return Container(
                            decoration: BoxDecoration(color: Colors.grey),
                            margin: const EdgeInsets.only(
                                left: 20, top: 20, right: 20),
                            child: ListTile(
                              title: Text(
                                tripName,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                tripPrice,
                                style: TextStyle(color: Colors.black),
                              ),
                              trailing: IconButton(
                                  onPressed: () =>
                                      cancelTrip(location, context),
                                  icon: Icon(Icons.delete)),
                            ),
                          );
                        }),
                  ),

                  //pay button
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Button(
                      text: 'Purchase trips',
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ));
  }
}
