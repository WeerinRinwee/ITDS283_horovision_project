import 'package:flutter/material.dart';

class CardTarot extends StatelessWidget {
  const CardTarot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        Positioned(
          top: 50,
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.55,
            // child: Image.asset(
            //   "assets/images/1.png",
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color.fromARGB(255, 210, 179, 220),
                  Color.fromARGB(255, 132, 66, 156),
                  Color.fromARGB(255, 72, 36, 85),
                ],
                focal: Alignment(0, -3),
                radius: 3,
              ),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(50),
              //   topRight: Radius.circular(50),
              // ),
            ),
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 60.0, left: 60.0, right: 60.0),
                  child: Column(
                    children: const [
                      Text(
                        "Horse",
                        style: TextStyle(
                            fontSize: 50,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text("Put the text",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                      Text(
                          "Put the text",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),

                const Spacer(), // Same Same Expanded
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/selectfunc");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, bottom: 20),
                      child: Container(
                        height: 62,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            gradient: const RadialGradient(
                              colors: [
                                Color.fromARGB(255, 250, 184, 130),
                                Color.fromARGB(255, 255, 160, 82),
                                Color.fromARGB(255, 248, 122, 19),
                                Color.fromARGB(255, 250, 117, 9),
                              ],
                              focal: Alignment(0, -4),
                              radius: 3,
                            )),
                        child: const Center(
                          child: Text(
                            "Go back select func",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ]),
    ));
  }
}
