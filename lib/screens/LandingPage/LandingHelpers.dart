import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/constants/constantcolors.dart';
import 'package:thesocial/screens/Homepage/homepage.dart';
import 'package:thesocial/screens/LandingPage/LandingUtils.dart';
import 'package:thesocial/screens/LandingPage/landingservices.dart';
import 'package:thesocial/services/Authentication.dart';

class LandingHelpers with ChangeNotifier {
  Constantcolors constantcolors = Constantcolors();

  Widget bodyImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/login.jpg"))),
    );
  }

  Widget taglinetext(BuildContext context) {
    return Positioned(
        top: 400,
        left: 10,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 170,
          ),
          child: RichText(
              text: TextSpan(
                  text: 'Are ',
                  style: TextStyle(
                      color: constantcolors.whitecolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  children: <TextSpan>[
                TextSpan(
                  text: 'You ',
                  style: TextStyle(
                      color: constantcolors.bluecolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                TextSpan(
                  text: 'Social ',
                  style: TextStyle(
                      color: constantcolors.bluecolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                TextSpan(
                  text: '?',
                  style: TextStyle(
                      color: constantcolors.whitecolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ])),
        ));
  }

  Widget mainbutton(BuildContext context) {
    return Positioned(
      top: 500,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (() {
                emailauthsheet(context);
              }),
              child: Container(
                child: Icon(
                  EvaIcons.emailOutline,
                  color: constantcolors.yellowcolor,
                ),
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: constantcolors.yellowcolor),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('signin with google');
                Provider.of<Authentication>(context, listen: false)
                    .Signinwithgoogle()
                    .whenComplete(() {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: Homepage(), type: PageTransitionType.fade));
                });
              },
              child: Container(
                child: Icon(
                  EvaIcons.google,
                  color: constantcolors.redcolor,
                ),
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: constantcolors.redcolor),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            GestureDetector(
              child: Container(
                child: Icon(
                  EvaIcons.facebook,
                  color: constantcolors.bluecolor,
                ),
                width: 80,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: constantcolors.bluecolor),
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget privacytext(BuildContext context) {
    return Positioned(
        top: 630,
        left: 20,
        right: 20,
        child: Container(
          child: Column(
            children: [
              Text(
                "By Continuing you agree to theSocial Terms Of",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              ),
              Text(
                "Services & Privacy",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
              )
            ],
          ),
        ));
  }

  emailauthsheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 150),
                  child: Divider(
                    thickness: 4,
                    color: constantcolors.whitecolor,
                  ),
                ),
                Provider.of<Landingservice>(context, listen: false)
                    .passwordlesssignin(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                        color: constantcolors.bluecolor,
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: constantcolors.whitecolor,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          Provider.of<Landingservice>(context, listen: false)
                              .loginsheet(context);
                        }),
                    MaterialButton(
                        color: constantcolors.redcolor,
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: constantcolors.whitecolor,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          Provider.of<LandingUtils>(context, listen: false)
                              .selectAvatarOptionsheet(context);
                        })
                  ],
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: constantcolors.bluegreycolor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
          );
        });
  }
}
