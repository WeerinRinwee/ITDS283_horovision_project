import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:ui';

// import 'package:font_awesome_flutter/name_icon_mapping.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var sizew = MediaQuery.of(context).size.width;
    var sizeh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(0.0, -1.1),
              child: Container(
                width: 420,
                height: 420,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/photo/cut1.png"),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            const Align(
              alignment: Alignment(-0.7, -0.1),
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Color.fromARGB(240, 37, 33, 50),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const Align(
              alignment: Alignment(0.55, 0.05),
              child: Text(
                'Let’s get started!',
                style: TextStyle(
                  color: Color.fromARGB(240, 37, 33, 50),
                  fontSize: 20,
                  // fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const Align(
              alignment: Alignment(-0.75, 0.2),
              child: Text(
                'What you looking for ... ?',
                style: TextStyle(
                  color: Color.fromARGB(240, 37, 33, 50),
                  fontSize: 20,
                  // fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 450, left: 40, right: 40),
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAnalytics.instance.logEvent(
                    name: "choose_function",
                    parameters: {
                      "button": "DailyTarot",
                    },
                  );
                  Navigator.pushNamed(context, '/randomcard');
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(145, 144, 193, 1),
                          Color.fromRGBO(108, 106, 198, 1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "Daily Tarot",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 530, left: 40, right: 40),
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAnalytics.instance.logEvent(
                    name: "choose_function",
                    parameters: {
                      "button": "chinesezodiac",
                    },
                  );
                  Navigator.pushNamed(context, '/chinesezodiac');
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(211, 179, 222, 1),
                          Color.fromRGBO(163, 119, 179, 1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "Chinese Zodiac",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 610, left: 40, right: 40),
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAnalytics.instance.logEvent(
                    name: "choose_function",
                    parameters: {
                      "button": "zodiac",
                    },
                  );
                  Navigator.pushNamed(context, '/zodiac');
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(194, 178, 255, 1),
                          Color.fromRGBO(125, 104, 255, 1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            "Zodiac",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: FaIcon(
                            FontAwesomeIcons.chevronRight,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(145, 144, 193, 1),
            boxShadow: [
              BoxShadow(
                blurRadius: 15.0,
                color: Color.fromARGB(65, 15, 13, 84),
              ),
            ],
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(30),
            //   topRight: Radius.circular(30),
            // ),
          ),
          height: 65,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/caution');
                  },
                  style: ElevatedButton.styleFrom(
                    shadowColor: Color.fromRGBO(145, 144, 193, 0),
                    backgroundColor: Color.fromRGBO(145, 144, 193, 1),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.logout,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 30,
                      ), // icon
                      Text(
                        "LOGOUT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ), // text
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shadowColor: Color.fromRGBO(145, 144, 193, 0),
                    backgroundColor: Color.fromRGBO(145, 144, 193, 1),
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.home,
                          size: 30,
                          color: Color.fromARGB(255, 255, 255, 255)), // icon
                      Text(
                        "Home",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ), // text
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




      // backgroundColor: Color.fromRGBO(145, 144, 193, 1),
      // selectedItemColor: Color.fromARGB(240, 37, 33, 50),
      // unselectedItemColor: Color.fromARGB(240, 37, 33, 50),
      // type: BottomNavigationBarType.fixed,
      // items: const <BottomNavigationBarItem>[
      //   IconButton(
      //     icon: Icon(Icons.home, color: Color.fromARGB(240, 37, 33, 50)),
      //     label: 'Home',
      //   ),
      //   IconButton(
      //     icon: Icon(
      //       Icons.people_outlined,
      //       color: Color.fromARGB(240, 37, 33, 50),
      //     ),
      //     label: '????',
      //   ),
      // bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: Color.fromRGBO(145, 144, 193, 1),
      //     selectedItemColor: Color.fromARGB(240, 37, 33, 50),
      //     unselectedItemColor: Color.fromARGB(240, 37, 33, 50),
      //     type: BottomNavigationBarType.fixed,
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home, color: Color.fromARGB(240, 37, 33, 50)),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.people_outlined,
      //           color: Color.fromARGB(240, 37, 33, 50),
      //         ),
      //         label: '????',
      //       ),
      //     ]