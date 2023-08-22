import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/models/locations.dart';

class LocationCard extends StatelessWidget {
  final Location location;
  final void Function()? onTap;

  const LocationCard({super.key, required this.location, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(left: 25.0),
        padding: const EdgeInsets.all(25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //display image
          Image.asset(
            location.imagePath,
            height: 170,
          ),
          //text
          Text(
            location.name,
            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ),
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price of attraction
                Text(
                  "\£" + location.price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                //location
                Text(
                  location.location,
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
