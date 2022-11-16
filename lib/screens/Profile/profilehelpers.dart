import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:thesocial/constants/constantcolors.dart';

class ProfileHelpers with ChangeNotifier {
  Constantcolors constantcolors = Constantcolors();

  Widget headerprofile(BuildContext context, DocumentSnapshot snapshot) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 200,
            width: 180,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    backgroundColor: constantcolors.transparant,
                    radius: 60,
                    backgroundImage: NetworkImage(snapshot['userimage']),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    snapshot['username'],
                    style: TextStyle(
                        color: constantcolors.whitecolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        EvaIcons.email,
                        color: constantcolors.greencolor,
                      ),
                      Text(
                        snapshot['username'],
                        style: TextStyle(
                            color: constantcolors.whitecolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: constantcolors.darkcolor,
                          borderRadius: BorderRadius.circular(15)),
                      height: 70,
                      width: 80,
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                                color: constantcolors.whitecolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(
                                color: constantcolors.whitecolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: constantcolors.darkcolor,
                          borderRadius: BorderRadius.circular(15)),
                      height: 70,
                      width: 80,
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                                color: constantcolors.whitecolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(
                                color: constantcolors.whitecolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: constantcolors.darkcolor,
                          borderRadius: BorderRadius.circular(15)),
                      height: 70,
                      width: 80,
                      child: Column(
                        children: [
                          Text(
                            '0',
                            style: TextStyle(
                                color: constantcolors.whitecolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 28),
                          ),
                          Text(
                            'Post ',
                            style: TextStyle(
                                color: constantcolors.whitecolor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: 70,
                  width: 80,
                  child: Column(
                    children: [
                      Text(
                        '0',
                        style: TextStyle(
                            color: constantcolors.whitecolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 28),
                      ),
                      Text(
                        'Post',
                        style: TextStyle(
                            color: constantcolors.whitecolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
