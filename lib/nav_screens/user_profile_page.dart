import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/color_utils/colors.dart';
import 'package:travelapp/models/drawer.dart';
import 'package:travelapp/nav_screens/camera_page.dart';
import 'package:travelapp/nav_screens/home_page.dart';
import 'package:travelapp/nav_screens/map_page.dart';
import 'package:travelapp/resuable_widget/textuser.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;

  //go to home page
  void goToHomePage() {
    //pop menu drawer
    Navigator.pop(context);
    //go to home page
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => HomePage())));
  }

  //go to AR page
  void goToCameraPage() {
    //pop menu drawer
    Navigator.pop(context);
    //go to profile page
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => CameraPage())));
  }

  //go to map page
  void goTMapaPage() {
    //pop menu drawer
    Navigator.pop(context);
    //go to map page
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => MapPage())));
  }

  //edit button
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.black,
              title: Text(
                'Edit ' + field,
                style: TextStyle(color: Colors.white),
              ),
              content: TextField(
                autofocus: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Enter your new " + field,
                    hintStyle: TextStyle(color: Colors.grey)),
                onChanged: (value) {
                  newValue = value;
                },
              ),
              actions: [
                //text button cancel
                TextButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),

                //save text button
                TextButton(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => Navigator.of(context).pop(newValue),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your profile"),
          backgroundColor: hexStringToColor('00E5FF'),
          titleTextStyle: TextStyle(
              fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
        ),
        drawer: MyDrawer(
          onTap: goToHomePage,
          onAR: goToCameraPage,
          onMap: goTMapaPage,
        ),
        body: ListView(children: [
          const SizedBox(
            height: 40,
          ),
          //Profile picture
          Icon(
            Icons.person,
            size: 80,
          ),

          SizedBox(
            height: 25,
          ),

          //user email
          Text(user.email!,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700])),

          SizedBox(height: 50),

          //details
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Text(
              'My Details',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),

          //username
          TextBox(
            text: 'leongw99',
            sectionName: 'Username',
            onPressed: () => editField('username'),
          ),

          //user bio
          TextBox(
            text: 'Home country: United Kingdom',
            sectionName: 'bio',
            onPressed: () => editField('bio'),
          ),

          //user email
          TextBox(
            text: user.email!,
            sectionName: 'email address',
            onPressed: () => editField('Bio'),
          ),

          SizedBox(height: 50),

          //visited places
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Visited places',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(height: 15),
                //list of visited places
                Text(' - Ye Olde Trip to Jerusalem.\nDate visited: 21/08/2023'),
                SizedBox(height: 5),
                Text(' - City Caves.\nDate visited: 12/08/2023'),
                SizedBox(height: 5),
                Text(' - Wollaton Hall.\nDate visited: 01/08/2023'),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.all(35),
            child: MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.blue,
              child: Text("Logout"),
            ),
          ),

          //places
          Padding(
            padding: const EdgeInsets.only(left: 26),
            child: Center(),
          )
        ]));

    //logout button
  }
}
