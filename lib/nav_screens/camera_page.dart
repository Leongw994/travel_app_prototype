import 'dart:async';

import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/color_utils/colors.dart';
import 'package:travelapp/models/drawer.dart';
import 'package:travelapp/nav_screens/home_page.dart';
import 'package:travelapp/nav_screens/map_page.dart';
import 'package:travelapp/nav_screens/user_profile_page.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late ARKitController arKitController;
  Timer? timer;
  bool anchorWasFound = false;

  @override
  void dispose() {
    timer?.cancel();
    arKitController.dispose();
    super.dispose();
  }

  //go to home page
  void goToHomePage() {
    //pop menu drawer
    Navigator.pop(context);
    //go to profile page
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => HomePage())));
  }

  //go to map page
  void goToMapPage() {
    //pop menu drawer
    Navigator.pop(context);
    //go to profile page
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => MapPage())));
  }

  //go to profile page
  void goToProfilePage() {
    //pop menu drawer
    Navigator.pop(context);
    //go to profile page
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => UserProfilePage())));
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
        onProfile: goToProfilePage,
        onTap: goToHomePage,
        onMap: goToMapPage,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ARKitSceneView(
            onARKitViewCreated: onARKitViewCreated,
            detectionImagesGroupName: 'AR Resources 1',
          ),
          anchorWasFound
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Point the camera at the landmark',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                )
        ],
      ),
    );
  }

  void onARKitViewCreated(ARKitController arKitController) {
    this.arKitController = arKitController;
    this.arKitController.onAddNodeForAnchor = _onImagesDetected;
  }

  void _onImagesDetected(ARKitAnchor anchor) {
    if (anchor is ARKitImageAnchor) {
      setState(() {
        anchorWasFound = true;
      });
    }

    final material =
        ARKitMaterial(diffuse: ARKitMaterialProperty.color(Colors.red));

    final arText = ARKitText(
      text:
          'This is Nottingham Castle built in 1390 AD.\ntap here to find out more!',
      extrusionDepth: 0.01,
      materials: [material],
    );

    final imagePosition = anchor.transform.getColumn(3);

    final containerNode = ARKitNode(
      geometry: arText,
      position:
          vector.Vector3(imagePosition.x, imagePosition.y, imagePosition.z),
      eulerAngles: vector.Vector3.zero(),
    );

    final infoTextPosition = vector.Vector3(
      imagePosition.x,
      imagePosition.y - 0.05,
      imagePosition.z,
    );

    arKitController.add(containerNode);

    // final node = ARKitNode(
    //   geometry: arText,
    //   position:
    //       vector.Vector3(imagePosition.x, imagePosition.y, imagePosition.z),
    //   eulerAngles: vector.Vector3.zero(),
    // );
    // arKitController.add(node);
  }
}
