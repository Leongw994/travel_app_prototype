import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/color_utils/colors.dart';
import 'package:travelapp/models/list_tile.dart';
import 'package:travelapp/resuable_widget/app_text.dart';
import 'package:travelapp/resuable_widget/reusable_widgets.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onLogout;
  final void Function()? onProfile;
  final void Function()? onAR;

  const MyDrawer(
      {super.key, this.onTap, this.onLogout, this.onProfile, this.onAR});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Drawer(
      backgroundColor: hexStringToColor('00E5FF'),
      child: Column(children: [
        //header
        DrawerHeader(child: logoWidget('images/book.png')),
        SizedBox(height: 10),
        AppText(
          text: 'Logged in as: ',
          colour: Colors.white,
          size: 16,
        ),
        SizedBox(height: 10),
        AppText(
          text: user.email!,
          colour: Colors.white,
          size: 16,
        ),
        SizedBox(
          height: 25,
        ),
        //home list tile
        MyTile(
          icon: Icons.home,
          text: 'Home',
          onTap: onTap,
        ),
        //profile list tile
        MyTile(
          icon: Icons.person_2_outlined,
          text: 'Profile',
          onTap: onProfile,
        ),
        //map list tile
        MyTile(
          icon: Icons.camera,
          text: 'Explore with AR',
          onTap: onProfile,
        ),
        //Logout tile
        MyTile(icon: Icons.logout, text: 'Logout', onTap: onLogout),
      ]),
    );
  }
}
