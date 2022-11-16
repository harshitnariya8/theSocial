import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/constants/constantcolors.dart';
import 'package:thesocial/screens/LandingPage/LandingHelpers.dart';

class LandingPage extends StatelessWidget {
  final Constantcolors constantcolors = Constantcolors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantcolors.whitecolor,
      body: Stack(
        children: [
          bodycolor(),
          Provider.of<LandingHelpers>(context, listen: false)
              .bodyImage(context),
          Provider.of<LandingHelpers>(context, listen: false)
              .taglinetext(context),
          Provider.of<LandingHelpers>(context, listen: false)
              .mainbutton(context),
          Provider.of<LandingHelpers>(context, listen: false)
              .privacytext(context)
        ],
      ),
    );
  }

  bodycolor() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
            0.5,
            0.9
          ],
              colors: [
            constantcolors.darkcolor,
            constantcolors.bluegreycolor,
          ])),
    );
  }
}
