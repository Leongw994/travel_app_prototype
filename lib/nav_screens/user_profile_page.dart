import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/color_utils/colors.dart';
import 'package:travelapp/models/drawer.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your profile"),
        backgroundColor: hexStringToColor('00E5FF'),
        titleTextStyle: TextStyle(
            fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
      ),
      drawer: MyDrawer(),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Signed in as " + user.email!),
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color: Colors.blue,
            child: Text("Logout"),
          )
        ],
      )),
    );
  }
}
