import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'param.dart';
import 'Sign.dart';

Future<Sign> fetchResult(zodiacsign) async {
  final response = await http.get(
    Uri.parse(
        'https://horoscope-astrology.p.rapidapi.com/sign?s=${zodiacsign}'),
    headers: {
      "X-RapidAPI-Key": "7a5981c6afmsh35e2daa287822a5p11e38fjsndce2b02434ba",
      "X-RapidAPI-Host": "horoscope-astrology.p.rapidapi.com"
    },
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Sign.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Show_info extends StatefulWidget {
  static const routeName = '/show';
  final String zodiacsign;
  final String title;
  final String category;
  const Show_info({
    Key? key,
    required this.zodiacsign,
    required this.title,
    required this.category,
    Object? param,
  }) : super(key: key);
  @override
  State<Show_info> createState() => _Show_info();
}

class _Show_info extends State<Show_info> {
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Param;
    late Future<Sign> futureSign;
    futureSign = fetchResult(args.zodiacsign);
    late String category = args.category;
    late String title = args.title;
    String imgpath = "assets/photo/${args.zodiacsign}2.png";
    List<Color> _colors = <Color>[
      Color.fromARGB(255, 15, 13, 84),
      Color.fromARGB(255, 6, 56, 136),
      Color.fromARGB(255, 166, 9, 9),
      Color.fromARGB(255, 40, 175, 17),
      Color.fromARGB(255, 0, 0, 0)
    ];

    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              color: identical(category, 'About')
                  ? _colors[0]
                  : identical(category, 'Personality')
                      ? _colors[1]
                      : identical(category, 'Love')
                          ? _colors[2]
                          : identical(category, 'Health')
                              ? _colors[3]
                              : identical(category, 'Career')
                                  ? _colors[4]
                                  : _colors[0],
              // Color.fromARGB(255, 15, 13, 84),
              borderRadius: BorderRadius.only(
                // bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(200),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: IconButton(
                        iconSize: 40,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 15),
                      child: Text("${category}",
                          style: TextStyle(
                            letterSpacing: 3,
                            fontSize: 30,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 75, top: 0),
                  child: Text("${title}",
                      style: TextStyle(
                        letterSpacing: 3,
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: identical(category, 'About')
                  ? _colors[0]
                  : identical(category, 'Personality')
                      ? _colors[1]
                      : identical(category, 'Love')
                          ? _colors[2]
                          : identical(category, 'Health')
                              ? _colors[3]
                              : identical(category, 'Career')
                                  ? _colors[4]
                                  : _colors[0],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(200),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 2,
          ),
        ),
        Align(
          alignment: Alignment(0, 0.5),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 15.0,
                  color: Color.fromARGB(65, 15, 13, 84),
                ),
              ],
              color: Color.fromRGBO(250, 250, 252, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.95,
            child: Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: FutureBuilder<Sign>(
                    future: futureSign,
                    builder: (context, snapshot) {
//'About'
                      if (snapshot.hasData & identical(category, 'About')) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: RichText(
                                text: TextSpan(
                                  text: "Date-Range: ",
                                  style: TextStyle(
                                      letterSpacing: 3,
                                      wordSpacing: 3,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${snapshot.data!.date_range}',
                                      // 'September 23 - October 22',
                                      style: TextStyle(
                                          letterSpacing: 3,
                                          wordSpacing: 3,
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: RichText(
                                text: TextSpan(
                                  text: "Symbol: ",
                                  style: TextStyle(
                                      letterSpacing: 3,
                                      wordSpacing: 3,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${snapshot.data!.symbol}',
                                      // "Scales",
                                      style: TextStyle(
                                          letterSpacing: 3,
                                          wordSpacing: 3,
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: RichText(
                                text: TextSpan(
                                  text: "Element: ",
                                  style: TextStyle(
                                      letterSpacing: 3,
                                      wordSpacing: 3,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${snapshot.data!.element}',
                                      //  "Air",
                                      style: TextStyle(
                                          letterSpacing: 3,
                                          wordSpacing: 3,
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: RichText(
                                text: TextSpan(
                                  text: "Ruling Planets: ",
                                  style: TextStyle(
                                      letterSpacing: 3,
                                      wordSpacing: 3,
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${snapshot.data!.ruling_planet}',
                                      // "Venus",
                                      style: TextStyle(
                                          letterSpacing: 3,
                                          wordSpacing: 3,
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                              ),
                              child: Text(
                                "About: ",
                                style: TextStyle(
                                    letterSpacing: 3,
                                    wordSpacing: 3,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text('${snapshot.data!.about}',
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    wordSpacing: 5,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.start),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Card(
                                color: _colors[0],
                                child: Center(
                                  child: Text("End",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                            ),
                          ],
                        );
//'Personality'
                      } else if (snapshot.hasData &
                          identical(category, 'Personality')) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                              ),
                              child: Text(
                                "Nature: ",
                                style: TextStyle(
                                    letterSpacing: 3,
                                    wordSpacing: 3,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text('${snapshot.data!.nature}',
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    wordSpacing: 5,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.start),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                              ),
                              child: Text(
                                "Strengths: ",
                                style: TextStyle(
                                    letterSpacing: 3,
                                    wordSpacing: 3,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text('${snapshot.data!.strengths}',
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    wordSpacing: 5,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.start),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                              ),
                              child: Text(
                                "Weaknesses: ",
                                style: TextStyle(
                                    letterSpacing: 3,
                                    wordSpacing: 3,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text('${snapshot.data!.weaknesses}',
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    wordSpacing: 5,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.start),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                              ),
                              child: Text(
                                "Man: ",
                                style: TextStyle(
                                    letterSpacing: 3,
                                    wordSpacing: 3,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text('${snapshot.data!.man}',
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    wordSpacing: 5,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.start),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                              ),
                              child: Text(
                                "Woman: ",
                                style: TextStyle(
                                    letterSpacing: 3,
                                    wordSpacing: 3,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text('${snapshot.data!.woman}',
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    wordSpacing: 5,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.start),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Card(
                                color: _colors[1],
                                child: Center(
                                  child: Text("End",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                            ),
                          ],
                        );
//'Love'
                      } else if (snapshot.hasData &
                          identical(category, 'Love')) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: RichText(
                                text: TextSpan(
                                  text: "Compatibility: ",
                                  style: TextStyle(
                                      letterSpacing: 3,
                                      wordSpacing: 3,
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '${snapshot.data!.compatibility}',
                                      style: TextStyle(
                                          letterSpacing: 3,
                                          wordSpacing: 3,
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                              ),
                              child: Text(
                                "Relationship: ",
                                style: TextStyle(
                                    letterSpacing: 3,
                                    wordSpacing: 3,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text('${snapshot.data!.relationship}',
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    wordSpacing: 5,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.start),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                              ),
                              child: Text(
                                "Love: ",
                                style: TextStyle(
                                    letterSpacing: 3,
                                    wordSpacing: 3,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Text('${snapshot.data!.love}',
                                  style: TextStyle(
                                    letterSpacing: 1,
                                    wordSpacing: 5,
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  textAlign: TextAlign.start),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Card(
                                color: _colors[2],
                                child: Center(
                                  child: Text("End",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                            ),
                          ],
                        );
//Health
                      } else if (snapshot.hasData &
                          (identical(category, 'Health') ||
                              identical(category, 'Career'))) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                              ),
                              child: Text(
                                "${category}: ",
                                style: TextStyle(
                                    letterSpacing: 3,
                                    wordSpacing: 3,
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: identical(category, 'Health') == true
                                    ? new Text('${snapshot.data!.health}',
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          wordSpacing: 5,
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.start)
                                    : new Text('${snapshot.data!.career}',
                                        style: TextStyle(
                                          letterSpacing: 1,
                                          wordSpacing: 5,
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        textAlign: TextAlign.start)),
                            Padding(
                              padding: EdgeInsets.only(top: 15, bottom: 15),
                              child: Card(
                                color: identical(category, 'About')
                                    ? _colors[0]
                                    : identical(category, 'Personality')
                                        ? _colors[1]
                                        : identical(category, 'Love')
                                            ? _colors[2]
                                            : identical(category, 'Health')
                                                ? _colors[3]
                                                : identical(category, 'Career')
                                                    ? _colors[4]
                                                    : _colors[0],
                                child: Center(
                                  child: Text("End",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return Center(
                          child: Container(
                        padding: const EdgeInsets.all(15),
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: CircularProgressIndicator(),
                      ));
                    }),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(0.9, -0.95),
          child: PhysicalModel(
            color: Color.fromARGB(65, 15, 13, 84),
            elevation: 10.0,
            shape: BoxShape.circle,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(imgpath),
              radius: 57,
            ),
          ),
        ),
      ]),
    ));
  }
}
