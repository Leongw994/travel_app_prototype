import 'dart:async';

import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/color_utils/colors.dart';
import 'package:travelapp/models/drawer.dart';
import 'package:vector_math/vector_math_64.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late ARKitController arKitController;
  Timer? timer;
  bool anchorFound = false;

  @override
  void dispose() {
    timer?.cancel();
    arKitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AR Landmark Overlay"),
          backgroundColor: hexStringToColor('00E5FF'),
          titleTextStyle: TextStyle(
              fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
        ),
        drawer: MyDrawer(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            ARKitSceneView(
              onARKitViewCreated: onARKitCreatedView,
              detectionImagesGroupName: 'AR content',
            ),
            anchorFound
                ? Container()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Point the camera at the landmark',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: hexStringToColor('000000')),
                    ),
                  ),
          ],
        ));
  }

  void onARKitCreatedView(ARKitController controller) {
    arKitController = controller;
    this.arKitController.onAddNodeForAnchor = onAnchorFound;

    // final image = ARKitReferenceImage(
    //   name: 'castle-2.png',
    //   physicalWidth: 0.3,
    // );
  }

  void onAnchorFound(ARKitAnchor anchor) {
    if (anchor is ARKitImageAnchor) {
      setState(() => anchorFound = true);

      final material = ARKitMaterial(
          lightingModelName: ARKitLightingModel.lambert,
          diffuse: ARKitMaterialProperty.image('moon.png'));

      final sphere = ARKitSphere(materials: [material], radius: 0.1);

      final imagePosition = anchor.transform.getColumn(3);
      final node = ARKitNode(
        geometry: sphere,
        position: Vector3(imagePosition.x, imagePosition.y, imagePosition.z),
        eulerAngles: Vector3.zero(),
      );
      arKitController.add(node);

      timer = Timer.periodic(const Duration(microseconds: 50), (timer) {
        final old = node.eulerAngles;
        final eulerAngles = Vector3(old.x + 0.01, old.y, old.z);
        node.eulerAngles = eulerAngles;
      });
    }
  }
}
