import 'package:flutter/material.dart';
import 'package:travelapp/color_utils/colors.dart';
import 'package:travelapp/models/drawer.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Nottingham"),
        backgroundColor: hexStringToColor('00E5FF'),
        titleTextStyle: TextStyle(
            fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
      ),
      drawer: MyDrawer(),
    );
  }
}
