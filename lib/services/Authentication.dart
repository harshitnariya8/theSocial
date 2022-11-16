import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication with ChangeNotifier {
  final FirebaseAuth firebaseauth = FirebaseAuth.instance;
  final GoogleSignIn googlesignin = GoogleSignIn();

  late String userUid;
  String get getuseruid => userUid;

  Future logIntoAccount(String email, String password) async {
    UserCredential userCredential = await firebaseauth
        .signInWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;
    userUid = user!.uid;
    print(userUid);
    notifyListeners();
  }

  Future CreateAccount(String email, String password) async {
    UserCredential userCredential = await firebaseauth
        .createUserWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;
    userUid = user!.uid;
    print('Created Account Uid => $userUid');
    notifyListeners();
  }

  Future Signinwithgoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googlesignin.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    final UserCredential userCredential =
        await firebaseauth.signInWithCredential(authCredential);
    final User? user = userCredential.user;
    assert(user?.uid != null);

    userUid = user!.uid;
    print('Google User id => $userUid');
    notifyListeners();
  }

  Future Signoutwithgoogle() async {
    return googlesignin.signOut();
  }
}
