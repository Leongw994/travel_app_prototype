import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/resuable_widget/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  //images list for use at the bottom pag
  var images1 = {"centre.jpg", "history.jpeg", "parks.jpeg", "jerusalem.jpg"};

  var images = {
    "Shopping.png": "Shopping",
    "cathedral.png": "History",
    "parks.png": "Parks",
    "drinks.png": "Food and Drinks"
  };

  @override
  Widget build(BuildContext context) {
    //TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //User avatar and menu icon
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(Icons.menu, size: 24, color: Colors.black),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                  padding: EdgeInsets.all(10.0),
                  child: Image.asset('images/user.png'),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          //Welcome message with user email
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: 'Hello ' + user.email! + "!"),
          ),
        ],
      ),
    );
  }
}

// class TabIndicatorStyle extends Decoration {
//   final Color color;
//   double radius;
//   TabIndicatorStyle({required this.color, required this.radius});
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     // TODO: implement createBoxPainter
//     return _circlePaint(color: color, radius: radius);
//   }
// }

// class _circlePaint extends BoxPainter {
//   final Color color;
//   double radius;
//   _circlePaint({required this.color, required this.radius});
//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     Paint _paint = Paint();
//     _paint.color = color;
//     _paint.isAntiAlias = true;
//     final Offset circleOffset = Offset(
//         configuration.size!.width / 2 - radius / 2, configuration.size!.height);
//     canvas.drawCircle(offset + circleOffset, radius, _paint);
//     // TODO: implement paint
//   }
// }
