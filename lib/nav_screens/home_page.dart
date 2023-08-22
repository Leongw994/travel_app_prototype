import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  List images = ["nottingham.png", "pub.jpeg", "wollaton_building.jpeg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
