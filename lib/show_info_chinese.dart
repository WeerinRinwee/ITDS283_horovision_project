import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'param.dart';
import 'Sign2.dart';

Future<List<Sign2>> fetchResult2(arg) async {
  final response = await http.get(
    Uri.parse('http://192.168.1.28/horo/connect.php?name=${arg}'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // print('object');
    // return Sign2.fromJson(jsonDecode(response.body));
    return sign2FromJson(response.body);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Show_info_chinese extends StatefulWidget {
  static const routeName = '/show_chinese';
  final String chinesssign;
  final String title;
  const Show_info_chinese({
    Key? key,
    required this.chinesssign,
    required this.title,
    Object? param,
  }) : super(key: key);

  @override
  State<Show_info_chinese> createState() => _Show_info_chinese();
}

class _Show_info_chinese extends State<Show_info_chinese> {
  late Future<List<Sign2>> _futureData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // late Future<dynamic> futureSign2;
    // late Future<List<Sign2>>? futureSign2 = fetchResult2(args.chinesssign);
    // return Text('data');
    final args = ModalRoute.of(context)!.settings.arguments as Param;
    _futureData = fetchResult2(args.chinesssign);
    String title = args.title;
    String imgpath = "assets/photo/${args.chinesssign}_zodiac.png";
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(225, 144, 112, 156),
              borderRadius: BorderRadius.only(
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
                      child: Text("${title}",
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
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(225, 144, 112, 156),
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
                  color: Color.fromARGB(120, 144, 112, 156),
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
                child: FutureBuilder<List<Sign2>>(
                    future: _futureData,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return 
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 15,
                                  ),
                                  child: Text(
                                    "${title}: ",
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
                                    child: new Text('${snapshot.data![0].details}',
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
                                    color: Color.fromARGB(225, 144, 112, 156),
                                    child: Center(
                                      child: Text("End",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
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
