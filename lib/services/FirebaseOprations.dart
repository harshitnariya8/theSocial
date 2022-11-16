import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/screens/LandingPage/LandingUtils.dart';
import 'package:thesocial/services/Authentication.dart';

class FirebaseOperations with ChangeNotifier {
  late UploadTask imageUploadTask;
  String? initUsername, initUserEmail;
  String initUserImage =
      'https://image.shutterstock.com/image-vector/default-avatar-profile-social-media-260nw-1920331226.jpg';
  String? get getInitUsername => initUsername;
  String? get getInitUserEmail => initUserEmail;
  String get getInitUserImage => initUserImage;

  Future uploadUserAvatar(BuildContext context) async {
    Reference imageReference = FirebaseStorage.instance.ref().child(
        'userProfileAvatar/${Provider.of<LandingUtils>(context, listen: false).getUserAvatar.path}/${TimeOfDay.now()}');

    imageUploadTask = imageReference.putFile(
        Provider.of<LandingUtils>(context, listen: false).getUserAvatar);

    await imageUploadTask.whenComplete(() {
      print('Image Uploaded');
    });
    imageReference.getDownloadURL().then((url) {
      Provider.of<LandingUtils>(context, listen: false).userAvatarUrl =
          url.toString();
      print(
          'user profile avatar url => ${Provider.of<LandingUtils>(context, listen: false).userAvatarUrl}');
      notifyListeners();
    });
  }

  Future createusercollection(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<Authentication>(context, listen: false).getuseruid)
        .set(data);
  }

  Future initUserData(BuildContext context) async {
    return FirebaseFirestore.instance
        .collection('user')
        .doc(Provider.of<Authentication>(context, listen: false).getuseruid)
        .get()
        .then((doc) {
      print('fetching Userdata');
      initUsername = doc.data()!['username'];
      initUserEmail = doc.data()!['useremail'];
      initUserImage = doc.data()!['userimage'];
      print(initUserEmail);
      print(initUserImage);
      print(initUsername);
      notifyListeners();
    });
  }
}
