import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/constants/constantcolors.dart';
import 'package:thesocial/screens/Homepage/homepage.dart';
import 'package:thesocial/screens/LandingPage/LandingUtils.dart';
import 'package:thesocial/services/Authentication.dart';

import '../../services/FirebaseOprations.dart';

class Landingservice with ChangeNotifier {
  Constantcolors constantcolors = Constantcolors();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  showUseravatar(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: Divider(
                    thickness: 4,
                    color: constantcolors.whitecolor,
                  ),
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: constantcolors.transparant,
                  backgroundImage: FileImage(
                      Provider.of<LandingUtils>(context, listen: false)
                          .userAvatar),
                ),
                Container(
                  child: Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          Provider.of<LandingUtils>(context, listen: false)
                              .pickUserAvatar(context, ImageSource.gallery);
                        },
                        child: Text(
                          'Reselect',
                          style: TextStyle(
                              color: constantcolors.whitecolor,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              decorationColor: constantcolors.whitecolor),
                        ),
                      ),
                      MaterialButton(
                        color: constantcolors.bluecolor,
                        onPressed: () {
                          Provider.of<FirebaseOperations>(context,
                                  listen: false)
                              .uploadUserAvatar(context)
                              .whenComplete(() {
                            signiinsheet(context);
                          });
                        },
                        child: Text(
                          'Confirm Image',
                          style: TextStyle(
                            color: constantcolors.whitecolor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: constantcolors.bluegreycolor,
                borderRadius: BorderRadius.circular(15)),
          );
        });
  }

  Widget passwordlesssignin(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            print('All User');
            return ListView(
                children: snapshot.data!.docs
                    .map((DocumentSnapshot documentSnapshot) {
              return ListTile(
                trailing: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.trashCan,
                    color: constantcolors.redcolor,
                  ),
                  onPressed: (() {}),
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(documentSnapshot['userimage']),
                ),
                subtitle: Text(
                  documentSnapshot['useremail'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: constantcolors.greencolor,
                    fontSize: 12,
                  ),
                ),
                title: Text(
                  documentSnapshot['username'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: constantcolors.greencolor),
                ),
              );
            }).toList());
          }
        },
      ),
    );
  }

  signiinsheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: constantcolors.bluegreycolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150),
                    child: Divider(
                      thickness: 4,
                      color: constantcolors.whitecolor,
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: FileImage(
                        Provider.of<LandingUtils>(context, listen: false)
                            .getUserAvatar),
                    backgroundColor: constantcolors.redcolor,
                    radius: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: userNameController,
                      decoration: InputDecoration(
                          hintText: 'Enter Name...',
                          hintStyle: TextStyle(
                            color: constantcolors.whitecolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      style: TextStyle(
                        color: constantcolors.whitecolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: userEmailController,
                      decoration: InputDecoration(
                          hintText: 'Enter Email...',
                          hintStyle: TextStyle(
                            color: constantcolors.whitecolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      style: TextStyle(
                        color: constantcolors.whitecolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: userPasswordController,
                      decoration: InputDecoration(
                          hintText: 'Enter Password...',
                          hintStyle: TextStyle(
                            color: constantcolors.whitecolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      style: TextStyle(
                        color: constantcolors.whitecolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: FloatingActionButton(
                      backgroundColor: constantcolors.redcolor,
                      onPressed: () {
                        if (userEmailController.text.isNotEmpty) {
                          Provider.of<Authentication>(context, listen: false)
                              .CreateAccount(userEmailController.text,
                                  userPasswordController.text)
                              .whenComplete(() {
                            print('Creating Collection');
                            Provider.of<FirebaseOperations>(context,
                                    listen: false)
                                .createusercollection(context, {
                              'useruid': Provider.of<Authentication>(context,
                                      listen: false)
                                  .getuseruid,
                              'useremail': userEmailController.text,
                              'username': userNameController.text,
                              'userimage': Provider.of<LandingUtils>(context,
                                      listen: false)
                                  .getUserAvatar
                            });
                          }).whenComplete(() {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    child: Homepage(),
                                    type: PageTransitionType.leftToRight));
                          });
                          ;
                        } else {
                          warningtext(context, 'Fill all the Data!!');
                        }
                      },
                      child: Icon(
                        FontAwesomeIcons.check,
                        color: constantcolors.whitecolor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  loginsheet(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150),
                    child: Divider(
                      thickness: 4,
                      color: constantcolors.whitecolor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: userEmailController,
                      decoration: InputDecoration(
                          hintText: 'Enter Email...',
                          hintStyle: TextStyle(
                            color: constantcolors.whitecolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      style: TextStyle(
                        color: constantcolors.whitecolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: userPasswordController,
                      decoration: InputDecoration(
                          hintText: 'Enter Password...',
                          hintStyle: TextStyle(
                            color: constantcolors.whitecolor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          )),
                      style: TextStyle(
                        color: constantcolors.whitecolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: constantcolors.bluecolor,
                    onPressed: () {
                      if (userEmailController.text.isNotEmpty) {
                        Provider.of<Authentication>(context, listen: false)
                            .CreateAccount(userEmailController.text,
                                userPasswordController.text)
                            .whenComplete(() {
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  child: Homepage(),
                                  type: PageTransitionType.leftToRight));
                        });
                      } else {
                        warningtext(context, 'Fill all the Data!!');
                      }
                    },
                    child: Icon(
                      FontAwesomeIcons.check,
                      color: constantcolors.whitecolor,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                  color: constantcolors.bluegreycolor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
            ),
          );
        });
  }

  warningtext(BuildContext context, String warning) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: constantcolors.darkcolor,
                borderRadius: BorderRadius.circular(15)),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                warning,
                style: TextStyle(
                  color: constantcolors.whitecolor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          );
        });
  }
}
