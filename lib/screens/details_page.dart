import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/color_utils/colors.dart';
import 'package:travelapp/models/locations.dart';
import 'package:travelapp/resuable_widget/app_large_text.dart';
import 'package:travelapp/resuable_widget/app_text.dart';
import 'package:travelapp/resuable_widget/button.dart';
import 'package:travelapp/resuable_widget/cart.dart';

class DetailsPage extends StatefulWidget {
  final Location location;
  const DetailsPage({super.key, required this.location});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  //stars rating
  int starsAvail = 4;
  //number of visitors
  int quantityCount = 0;

  //remove visitors
  void decrement() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //increase visitors
  void increment() {
    setState(() {
      quantityCount++;
    });
  }

  //Book trip method
  void bookTrip() {
    if (quantityCount > 0) {
      //access shop
      final shop = context.read<Shop>();
      //add to cart
      shop.addToBasket(widget.location, quantityCount);
      //notify the user if the purchase was successful
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          content: const Text('Booking successful!'),
          actions: [
            IconButton(
              onPressed: () {
                //pop once to remove dialog box
                Navigator.pop(context);
                //pop again to go to previous screen
                Navigator.pop(context);
              },
              icon: Icon(Icons.done),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            //icon back to home page
            Positioned(
              left: 20,
              top: 70,
              child: Row(children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu),
                  color: Colors.black,
                ),
              ]),
            ),
            //background image of the attraction
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.location.imagePath),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(
              top: 330,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 550,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                                text: widget.location.name,
                                colour: Colors.black54),
                            AppLargeText(
                              text: "   £" + widget.location.price,
                              colour: hexStringToColor('00BCD4'),
                              size: 10,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: hexStringToColor('00BCD4')),
                        SizedBox(width: 10),
                        AppText(
                          text: "Nottingham, U.K.",
                          colour: hexStringToColor('00BCD4'),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: index < starsAvail
                                    ? Colors.deepOrange
                                    : Colors.orangeAccent);
                          }),
                        ),
                        SizedBox(width: 10),
                        AppText(
                          text: "(4.5)",
                          colour: hexStringToColor('00E5FF'),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    AppLargeText(
                        text: "Description",
                        colour: Colors.black.withOpacity(0.8)),
                    SizedBox(height: 5),
                    Text(widget.location.description),
                    SizedBox(height: 15),
                    //Number of visitors
                    AppText(
                      text: "Enter the number of visitors",
                      size: 15,
                      colour: hexStringToColor('00B8D4'),
                    ),
                    Positioned(
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //price
                            Text(
                              "\£" + widget.location.price,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                            //number of people
                            Row(
                              children: [
                                //minus button
                                Container(
                                    child: IconButton(
                                  icon: Icon(
                                    Icons.remove,
                                    color: Colors.black,
                                  ),
                                  onPressed: decrement,
                                )),
                                //quantity count
                                SizedBox(
                                  width: 40,
                                  child: Center(
                                    child: Text(
                                      quantityCount.toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                  ),
                                ),
                                //plus button
                                Container(
                                    child: IconButton(
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                  onPressed: increment,
                                )),
                              ],
                            )
                          ],
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),
            //Book trip button
            SizedBox(height: 25),

            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Button(text: 'Book trip', onTap: bookTrip),
            ),
          ],
        ),
      ),
    );
  }
}
