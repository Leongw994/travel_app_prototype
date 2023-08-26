import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelapp/authentication/main_page.dart';
import 'package:travelapp/resuable_widget/cart.dart';
import 'package:travelapp/screens/booked_trips_page.dart';
import 'package:travelapp/screens/main_screen.dart';
import 'package:travelapp/screens/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      routes: {
        '/welcomepage': (context) => const WelcomePage(),
        '/homepage': (context) => const MainScreen(),
        '/shoppage': (context) => const BookedTripPage()
      },
    );
  }
}
