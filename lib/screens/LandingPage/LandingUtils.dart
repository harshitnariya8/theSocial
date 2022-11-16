import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/constants/constantcolors.dart';
import 'package:thesocial/screens/LandingPage/landingservices.dart';

class LandingUtils with ChangeNotifier {
  Constantcolors constantcolors = Constantcolors();

  final picker = ImagePicker();
  late File userAvatar;
  File get getUserAvatar => userAvatar;
  late String userAvatarUrl;
  String get getUserAvatarUrl => userAvatarUrl;

  Future pickUserAvatar(BuildContext context, ImageSource source) async {
    final pickeduseravatar = await picker.getImage(source: source);
    pickeduseravatar == null
        ? print('Select Image..')
        : userAvatar = File(pickeduseravatar.path);

    print(userAvatar.path);

    userAvatar != null
        ? Provider.of<Landingservice>(context, listen: false)
            .showUseravatar(context)
        : print('Image Upload error');

    notifyListeners();
  }

  Future selectAvatarOptionsheet(BuildContext context) async {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      color: constantcolors.bluecolor,
                      onPressed: () {
                        pickUserAvatar(context, ImageSource.gallery)
                            .whenComplete(() {
                          Navigator.pop(context);
                          Provider.of<Landingservice>(context, listen: false)
                              .showUseravatar(context);
                        });
                      },
                      child: Text(
                        'Gallary',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: constantcolors.whitecolor),
                      ),
                    ),
                    MaterialButton(
                      color: constantcolors.bluecolor,
                      onPressed: () {
                        pickUserAvatar(context, ImageSource.camera)
                            .whenComplete(() {
                          Navigator.pop(context);
                          Provider.of<Landingservice>(context, listen: false)
                              .showUseravatar(context);
                        });
                      },
                      child: Text(
                        'Camera',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: constantcolors.whitecolor),
                      ),
                    )
                  ],
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: constantcolors.bluegreycolor,
                borderRadius: BorderRadius.circular(12)),
          );
        });
  }
}
