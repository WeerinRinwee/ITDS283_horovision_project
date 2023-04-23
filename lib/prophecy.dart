import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'DailyCard.dart';

class Prophecy extends StatefulWidget {
  @override
  _Prophecy createState() => _Prophecy();
}

class _Prophecy extends State<Prophecy> {
  late Future<DailyCard> getRandomCard;
  @override
  void initState() {
    super.initState();
    getRandomCard = fetchRandomCard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff9190C1),
          title: const Text('Prophecy'),
        ),
        body: FutureBuilder(
            future: getRandomCard,
            builder: (
              BuildContext context,
              AsyncSnapshot<dynamic> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.done) {
                var result = snapshot.data?.cards ?? [];
                return ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (BuildContext context, int index) {
                    final card = result[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SafeArea(
                            child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.height * 1,
                              height:
                                  MediaQuery.of(context).size.height * 0.897,
                              decoration: const BoxDecoration(
                                  gradient: RadialGradient(
                                colors: [
                                  Color.fromARGB(255, 167, 161, 223),
                                  Color.fromARGB(255, 201, 200, 231),
                                  Color(0xFFC9C8E7),
                                ],
                                focal: Alignment(0, -3),
                                radius: 6,
                              )),
                            ),
                            Positioned(
                              top: 25,
                              left: 30,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 210,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFE2E2A3),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 35,
                              left: 45,
                              child: Text(
                                card.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Positioned(
                                top: 70,
                                child: Container(
                                  width: 330,
                                  height: 330,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/photo/Tarot Reading.png'),
                                          fit: BoxFit.cover)),
                                )),
                            Positioned(
                              top: 420,
                              left: 20,
                              child: Container(
                                child: SingleChildScrollView(
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Text(
                                          card.meaningUp,
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.all(15),
                                            child: Text(
                                              card.meaningRev,
                                              style: TextStyle(fontSize: 15),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                width: 350,
                                height: 250,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 186, 203, 220),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 620,
                              left: 255,
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AlertDialog(
                                          content: Image(
                                            image: AssetImage(
                                                'assets/photo/something.jpg'),
                                            width: 350,
                                            height: 350,
                                          ),
                                        );
                                      });
                                },
                                child: Text(
                                  "Try to press!",
                                  style: TextStyle(fontSize: 15),
                                ),
                                style: ButtonStyle(backgroundColor:
                                    MaterialStateColor.resolveWith(
                                        (Set<MaterialState> State) {
                                  if (State.contains(MaterialState.hovered))
                                    return Color(0xffFEC8D8);
                                  // ยังไม่กด
                                  return Color(0xffD291BC);
                                })),
                              ),
                            ),
                          ],
                        ))
                      ],
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            }));
  }
}

Future<DailyCard> fetchRandomCard() async {
  final response = await http
      .get(Uri.parse('https://tarot-api.onrender.com/api/v1/cards/random?n=1'));
  if (response.statusCode == 200) {
    return dailyCardFromJson(response.body);
  } else {
    throw Exception('Failed to load Card');
  }
}
// Reference  https://rws-cards-api.herokuapp.com