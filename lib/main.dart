import 'package:flutter/material.dart';

import 'dart:math';
import 'package:horovision_project/For_user.dart';
import 'package:horovision_project/caution_screen.dart';
import 'package:horovision_project/home.dart';
import 'package:horovision_project/login.dart';
import 'package:horovision_project/randomcard.dart';
import 'package:horovision_project/register.dart';
import 'chinesezodiac.dart';
import 'param.dart';
import '/zodiac.dart';
import 'category.dart';
import 'prophecy.dart';
import 'show_info.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

import 'show_info_chinese.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: <NavigatorObserver>[observer],
      title: 'Horovision Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        "/caution": (BuildContext context) => CautionScreen(),
        "/homepage": (BuildContext context) => HomePage(),
        "/login": (BuildContext context) => LoginScreenState(),
        "/for_user": (BuildContext context) => User(),
        "/regist": (BuildContext context) => Registerscreen(),
        "/zodiac": (BuildContext context) => Zodiac(),
        "/chinesezodiac": (BuildContext context) => Chinesezodiac(),
        "/randomcard": (BuildContext context) => RandomCard(),
        "/cardresult": (BuildContext context) => Prophecy(),
        Category.routeName: (BuildContext context) =>
            const Category(category: '', zodiacsign: '', title: ''),
        Show_info.routeName: (BuildContext context) =>
            Show_info(category: '', zodiacsign: '', title: ''),
        Show_info_chinese.routeName: (BuildContext context) =>
            const Show_info_chinese(chinesssign: '', title: ''),
      },
      // initialRoute: "/for_user",
      // initialRoute: "/homepage",
      initialRoute: "/caution",
    );
  }
}
