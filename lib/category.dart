import 'dart:convert';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:ui';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'param.dart';
import 'Sign.dart';
import 'show_info.dart';

class Category extends StatefulWidget {
  static const routeName = '/category';
  final String zodiacsign;
  final String category;
  final String title;
  const Category({
    Key? key,
    required this.zodiacsign,
    required this.category,
    required this.title,
    Object? param,
  }) : super(key: key);
  @override
  _categoryState createState() => _categoryState();
}

class _categoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Param;
    String imgsign = "assets/photo/${args.zodiacsign}.png";
    String title = args.title;
    var sizew = MediaQuery.of(context).size.width;
    var sizeh = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color.fromARGB(255, 15, 13, 84),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0.0, -1.1),
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(imgsign),
                fit: BoxFit.cover,
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 325, left: 35, right: 35),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Show_info.routeName,
                    arguments:
                        Param(args.zodiacsign, '-', args.title, 'About'));
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Ink(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 15, 13, 84),
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
                          "About",
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
                          FontAwesomeIcons.circleInfo,
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
            padding: const EdgeInsets.only(top: 400, left: 35, right: 35),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Show_info.routeName,
                    arguments:
                        Param(args.zodiacsign, '-', args.title, 'Personality'));
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Ink(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 6, 56, 136),
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
                          "Personality",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 23),
                        child: Icon(
                          Icons.psychology_alt,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 475, left: 35, right: 35),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Show_info.routeName,
                    arguments: Param(args.zodiacsign, '-', args.title, 'Love'));
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Ink(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 166, 9, 9),
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
                          "Love & Relationship",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 23),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 550, left: 35, right: 35),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Show_info.routeName,
                    arguments:
                        Param(args.zodiacsign, '-', args.title, 'Health'));
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Ink(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 40, 175, 17),
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
                          "Health",
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
                          FontAwesomeIcons.fileMedical,
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
            padding: const EdgeInsets.only(top: 625, left: 35, right: 35),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, Show_info.routeName,
                    arguments:
                        Param(args.zodiacsign, '-', args.title, 'Career'));
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: const Color.fromARGB(0, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: Ink(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 0, 0),
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
                          "Career",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.work,
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
    );
  }
}
