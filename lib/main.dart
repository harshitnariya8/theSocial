import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thesocial/constants/constantcolors.dart';
import 'package:thesocial/screens/Homepage/HomepageHelpers.dart';
import 'package:thesocial/screens/LandingPage/LandingHelpers.dart';
import 'package:thesocial/screens/LandingPage/LandingUtils.dart';
import 'package:thesocial/screens/LandingPage/landingservices.dart';
import 'package:thesocial/screens/Profile/profilehelpers.dart';
import 'package:thesocial/screens/Splashscreens/splashscreen.dart';
import 'package:thesocial/services/Authentication.dart';
import 'package:thesocial/services/FirebaseOprations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Constantcolors constantcolors = Constantcolors();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          home: Splashscreen(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            accentColor: constantcolors.bluecolor,
            canvasColor: Colors.transparent,
          ),
        ),
        providers: [
          ChangeNotifierProvider(
            create: (_) => LandingUtils(),
          ),
          ChangeNotifierProvider(
            create: (_) => FirebaseOperations(),
          ),
          ChangeNotifierProvider(
            create: (_) => Authentication(),
          ),
          ChangeNotifierProvider(
            create: (_) => LandingHelpers(),
          ),
          ChangeNotifierProvider(
            create: (_) => Landingservice(),
          ),
          ChangeNotifierProvider(
            create: (_) => HomepageHelpers(),
          ),
          ChangeNotifierProvider(
            create: (_) => ProfileHelpers(),
          )
        ]);
  }
}
