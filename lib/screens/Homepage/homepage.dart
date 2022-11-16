import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/screens/Chatroom/chatroom.dart';
import 'package:thesocial/screens/Homepage/HomepageHelpers.dart';
import 'package:thesocial/screens/Profile/profile.dart';
import 'package:thesocial/screens/feed/feed.dart';
import 'package:thesocial/services/FirebaseOprations.dart';

import '../../constants/constantcolors.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Constantcolors constantcolors = Constantcolors();
  final PageController _homepageController = PageController();
  int pageindex = 0;

  @override
  void initState() {
    Provider.of<FirebaseOperations>(context, listen: false)
        .initUserData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: constantcolors.darkcolor,
        body: PageView(
          controller: _homepageController,
          children: [Feed(), ChatRoom(), Profile()],
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (page) {
            setState(() {
              pageindex = page;
            });
          },
        ),
        bottomNavigationBar:
            Provider.of<HomepageHelpers>(context, listen: false)
                .bottomNavbar(context, pageindex, _homepageController));
  }
}
