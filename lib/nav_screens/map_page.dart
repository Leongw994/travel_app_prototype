import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelapp/color_utils/colors.dart';
import 'package:travelapp/models/drawer.dart';
import 'package:travelapp/nav_screens/camera_page.dart';
import 'package:travelapp/nav_screens/home_page.dart';
import 'package:travelapp/nav_screens/user_profile_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  late Position currentPos;

  final CameraPosition initialPos =
      CameraPosition(target: LatLng(52.9548, -1.1581), zoom: 14);

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    setState(() {
      currentPos = position;
    });
  }

  //go to AR page
  void goToCameraPage() {
    //pop menu drawer
    Navigator.pop(context);
    //go to profile page
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => CameraPage())));
  }

  //go to profile page
  void goToProfilePage() {
    //pop menu drawer
    Navigator.pop(context);
    //go to profile page
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => UserProfilePage())));
  }

  //go to home page
  void goToHomePage() {
    //pop menu drawer
    Navigator.pop(context);
    //go to home page
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Explore Nottingham"),
          backgroundColor: hexStringToColor('00E5FF'),
          titleTextStyle: TextStyle(
              fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
        ),
        drawer: MyDrawer(
          onTap: goToHomePage,
          onAR: goToCameraPage,
          onProfile: goToProfilePage,
        ),
        body: GoogleMap(
          initialCameraPosition: initialPos,
          onMapCreated: (controller) {
            mapController = controller;
          },
          markers: _buildMarker(),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        ));
  }

  Set<Marker> _buildMarker() {
    Set<Marker> markers = {};
    //add markers for main landmarks
    markers.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(52.9496, -1.1548),
        infoWindow: InfoWindow(title: "Nottingham Castle. Built: 1068 AD")));

    markers.add(Marker(
        markerId: MarkerId('2'),
        position: LatLng(52.9493, -1.1526),
        infoWindow: InfoWindow(
            title: "Ye Olde Trip to Jerusalem. Established: 1189 AD")));

    markers.add(Marker(
        markerId: MarkerId('3'),
        position: LatLng(52.9507, -1.1451),
        infoWindow: InfoWindow(title: "City of Caves")));

    markers.add(Marker(
        markerId: MarkerId('4'),
        position: LatLng(52.9506, -1.1444),
        infoWindow: InfoWindow(title: "The Museum of National Justice")));

    markers.add(Marker(
        markerId: MarkerId('5'),
        position: LatLng(52.9398, -1.1328),
        infoWindow:
            InfoWindow(title: "City Ground: Nottingham Forest Stadium")));

    markers.add(Marker(
        markerId: MarkerId('6'),
        position: LatLng(52.9478, -1.1209),
        infoWindow: InfoWindow(title: "Wollaton Hall")));

    markers.add(Marker(
        markerId: MarkerId('7'),
        position: LatLng(52.9554, -1.1605),
        infoWindow: InfoWindow(title: "Haunted Museum of Nottingham")));

    markers.add(Marker(
        markerId: MarkerId('8'),
        position: LatLng(52.9364, -1.1953),
        infoWindow: InfoWindow(
            title: "University Park Campus: University of Nottingham")));

    return markers;
  }
}
