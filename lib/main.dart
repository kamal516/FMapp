// @dart = 2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:radioapp/views/bar.dart';
import 'package:radioapp/views/channel_screen.dart';
import 'package:radioapp/views/homescreem.dart';
import 'package:radioapp/views/introduction_screen.dart';
import 'package:radioapp/views/musicPlay_screen.dart';
import 'package:radioapp/views/profile.dart';
import 'package:radioapp/views/splash_screen.dart';
import 'package:radioapp/views/test.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key key, this.showHome}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: homescreen()
        //   profile()
        //Tester()
        //  MusicPlayScreen()
        // Example()
        // Testscreen()
        // showHome ? SplashScreen() : IntroductionScreen()
        // SplashScreen()
        //ChannelScreen()
        );
  }
}
