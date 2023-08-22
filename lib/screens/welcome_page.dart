import 'package:flutter/material.dart';
import 'package:travelapp/resuable_widget/app_large_text.dart';
import 'package:travelapp/resuable_widget/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["nottingham.png", "pub.jpeg", "wollaton_building.jpeg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Discover"),
                        AppText(text: "Nottingham"),
                        SizedBox(height: 20),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                "Get ready for an extraordinary journey where history and technology merge to bring the city of Nottingham to life. Our augmented reality experience will immerse you in the rich heritage, iconic landmarks and captivating stories that define the incredible destination",
                            size: 14,
                          ),
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexDots ? 20 : 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? Colors.greenAccent
                                  : Colors.greenAccent.withOpacity(0.3)),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
