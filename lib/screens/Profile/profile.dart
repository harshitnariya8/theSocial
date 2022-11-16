import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/constants/constantcolors.dart';
import 'package:thesocial/screens/Profile/profilehelpers.dart';
import 'package:thesocial/services/Authentication.dart';

class Profile extends StatelessWidget {
  Constantcolors constantcolors = Constantcolors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            EvaIcons.settings2Outline,
            color: constantcolors.lightbluecolor,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                EvaIcons.logOutOutline,
                color: constantcolors.greencolor,
              ))
        ],
        backgroundColor: constantcolors.bluegreycolor.withOpacity(0.4),
        title: RichText(
          text: TextSpan(
            text: 'Profile',
            style: TextStyle(
                color: constantcolors.whitecolor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(Provider.of<Authentication>(context, listen: false)
                      .getuseruid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return new Column(
                    children: [
                      Provider.of<ProfileHelpers>(context, listen: false)
                          .headerprofile(context, snapshot.data!)
                    ],
                  );
                }
              },
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: constantcolors.bluegreycolor.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }
}
