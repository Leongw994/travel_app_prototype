// import 'package:artravel/screens/welcome_page.dart';
// import 'package:artravel/utils/color_utils.dart';
// import 'package:artravel/widgets/reusable_widgets.dart';
// import 'package:flutter/material.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   TextEditingController _userNameTextController = TextEditingController();
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           title: const Text(
//             'Sign Up',
//             style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//         ),
//         body: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//               hexStringToColor('00E5FF'),
//               hexStringToColor('18FFFF'),
//               hexStringToColor('18FFFF')
//             ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//             child: SingleChildScrollView(
//                 child: Padding(
//               padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
//               child: Column(
//                 children: <Widget>[
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   reusableTextField("Enter username", Icons.person_outline,
//                       false, _userNameTextController),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   reusableTextField("Enter your email address",
//                       Icons.email_outlined, false, _emailTextController),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   reusableTextField("Enter passwrod", Icons.lock_outlined, true,
//                       _passwordTextController),
//                   const SizedBox(height: 10),
//                   loginButton(context, false, () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) => WelcomePage()));
//                   })
//                 ],
//               ),
//             ))));
//   }
// }
