import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/color_utils/colors.dart';
import 'package:travelapp/models/drawer.dart';
import 'package:travelapp/nav_screens/camera_page.dart';
import 'package:travelapp/nav_screens/user_profile_page.dart';
import 'package:travelapp/resuable_widget/app_large_text.dart';
import 'package:travelapp/resuable_widget/app_text.dart';
import 'package:travelapp/resuable_widget/cart.dart';
import 'package:travelapp/resuable_widget/location_card.dart';
import 'package:travelapp/screens/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //images that viewed at the botton of the page
  var images = {
    "Shopping.png": "Shopping",
    "cathedral.png": "History",
    "parks.png": "Parks",
    "drinks.png": "Food and Drinks"
  };

  //goes to the profile page
  void navigatetoDetail(int index) {
    //locations list
    final shop = context.read<Shop>();
    final locationList = shop.locationList;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPage(
                  location: locationList[index],
                )));
  }

  //go to profile page
  void goToProfilePage() {
    //pop menu drawer
    Navigator.pop(context);
    //go to profile page
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => UserProfilePage())));
  }

  //go to AR page
  void goToCameraPage() {
    //pop menu drawer
    Navigator.pop(context);
    //go to profile page
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => CameraPage())));
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final locationList = shop.locationList;
    //TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: hexStringToColor('00E5FF'),
        titleTextStyle: TextStyle(
            fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.bold),
      ),
      drawer: MyDrawer(
        onProfile: goToProfilePage,
        onAR: goToCameraPage,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //User avatar and menu icon
          // Container(
          //   padding: const EdgeInsets.only(top: 70, left: 20),
          //   child: Row(
          //     children: [
          //       AppLargeText(
          //         text: 'Welcome to MyNotts!',
          //         size: 11,
          //       ),
          //       //MyDrawer(),
          //       Expanded(child: Container()),
          //       Container(
          //         margin: const EdgeInsets.only(right: 20),
          //         width: 50,
          //         height: 50,
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: Colors.grey.withOpacity(0.5)),
          //         padding: EdgeInsets.all(10.0),
          //         child: Image.asset('images/user.png'),
          //       ),
          //     ],
          //   ),
          // ),
          //Welcome message with user email
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text('Search locations!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          ),
          SizedBox(height: 20),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          SizedBox(height: 11),
          //recommendations
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Recommendations',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: locationList.length,
              itemBuilder: (context, index) => LocationCard(
                  location: locationList[index],
                  onTap: () => navigatetoDetail(
                        index,
                      )),
            ),
          ),
          SizedBox(height: 20),
          //explore more tabs
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: "Explore more", size: 15),
                  AppText(text: "See all", colour: Colors.grey)
                ],
              )),
          SizedBox(height: 15),
          Container(
              width: double.maxFinite,
              height: 120,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Column(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 20),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(
                                    "images/" + images.keys.elementAt(index)),
                                fit: BoxFit.cover),
                          )),
                      SizedBox(height: 10),
                      Container(
                          child: AppText(
                        text: images.values.elementAt(index),
                        colour: Colors.grey,
                      )),
                    ]);
                  }))
        ],
      ),
    );
  }
}
