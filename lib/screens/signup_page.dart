import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelapp/color_utils/colors.dart';

import '../resuable_widget/reusable_widgets.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUpPage({super.key, required this.showLoginPage});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();

  Future signUp() async {
    try {
      if (isPasswordCorrect()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailTextController.text.trim(),
          password: _passwordTextController.text.trim(),
        );
      }
    } on FirebaseAuthException catch (ex) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                  "user email address already exists, choose a different one!"),
            );
          });
    }
  }

  bool isPasswordCorrect() {
    if (_passwordTextController.text.trim() ==
        _confirmPasswordTextController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: hexStringToColor('18FFFF'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logoWidget("images/book.png"),
              SizedBox(
                height: 25,
              ),
              Text(
                "MyNotts",
                style: GoogleFonts.bebasNeue(fontSize: 36),
              ),
              SizedBox(height: 5),
              Text(
                "Register below with chosen credentials",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              //company logo

              //email text field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _emailTextController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //password text field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _passwordTextController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //confirm password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: _confirmPasswordTextController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Retype password',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: hexStringToColor('00B8D4'),
                        borderRadius: BorderRadius.circular(13)),
                    child: Center(
                        child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )),
                  ),
                ),
              ),
              SizedBox(height: 27),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a member?",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      "Login Now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
