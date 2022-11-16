import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/constants/constantcolors.dart';
import 'package:thesocial/services/FirebaseOprations.dart';

class HomepageHelpers with ChangeNotifier {
  Constantcolors constantcolors = Constantcolors();

  Widget bottomNavbar(
      BuildContext context, int index, PageController pageController) {
    return CustomNavigationBar(
        currentIndex: index,
        bubbleCurve: Curves.bounceIn,
        scaleCurve: Curves.decelerate,
        selectedColor: constantcolors.bluecolor,
        unSelectedColor: constantcolors.whitecolor,
        strokeColor: constantcolors.bluecolor,
        scaleFactor: 0.5,
        iconSize: 30,
        onTap: (val) {
          index = val;
          pageController.jumpToPage(val);
          notifyListeners();
        },
        backgroundColor: Color(0xff040307),
        items: [
          CustomNavigationBarItem(icon: Icon(EvaIcons.home)),
          CustomNavigationBarItem(icon: Icon(Icons.message_rounded)),
          CustomNavigationBarItem(
              icon: CircleAvatar(
                  radius: 15,
                  backgroundColor: constantcolors.bluegreycolor,
                  backgroundImage: NetworkImage(
                      Provider.of<FirebaseOperations>(context, listen: false)
                          .getInitUserImage)))
        ]);
  }
}
