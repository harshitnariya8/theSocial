import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thesocial/constants/constantcolors.dart';
import 'package:thesocial/screens/LandingPage/landingpage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Constantcolors constantcolors = Constantcolors();

  @override
  void initState() {
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: LandingPage(), type: PageTransitionType.fade)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantcolors.darkcolor,
      body: Center(
        child: RichText(
            text: TextSpan(
                text: 'the',
                style: TextStyle(
                    color: constantcolors.whitecolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
                children: <TextSpan>[
              TextSpan(
                text: 'Social',
                style: TextStyle(
                    color: constantcolors.bluecolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )
            ])),
      ),
    );
  }
}
