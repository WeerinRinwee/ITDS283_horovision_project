import 'package:flutter/material.dart';

class RandomCard extends StatelessWidget {
  const RandomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9190C1),
        title: const Text('Tarot Card'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SafeArea(
                child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.height,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      gradient: RadialGradient(
                    colors: [
                      Color.fromARGB(255, 42, 36, 95),
                      Color.fromARGB(255, 201, 200, 231),
                      Color(0xFFC9C8E7),
                    ],
                    focal: Alignment(0, -3),
                    radius: 6,
                  )),
                ),
                Positioned(
                  top: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "Daily Horoscope",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(25),
                    child: Text(
                      "Set your mind to pray for what you want,"
                      "then ask a question and pick one card."
                      "The answer will appear through the prediction from the Gypsy card you have selected.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const Positioned(
                    top: 210,
                    left: 120,
                    child: Image(
                      image: AssetImage(
                          'assets/photo/Your 2023 Predictions Horoscope Tarot Your Story.png'),
                      width: 300,
                      height: 300,
                    )),
                const Positioned(
                    top: 214,
                    left: 80,
                    child: Image(
                      image: AssetImage(
                          'assets/photo/Your 2023 Predictions Horoscope Tarot Your Story.png'),
                      width: 300,
                      height: 300,
                    )),
                const Positioned(
                    top: 218,
                    left: 40,
                    child: Image(
                      image: AssetImage(
                          'assets/photo/Your 2023 Predictions Horoscope Tarot Your Story.png'),
                      width: 300,
                      height: 300,
                    )),
                const Positioned(
                    top: 222,
                    left: -5,
                    child: Image(
                      image: AssetImage(
                          'assets/photo/Your 2023 Predictions Horoscope Tarot Your Story.png'),
                      width: 300,
                      height: 300,
                    )),
                const Positioned(
                    top: 570,
                    child: Text(
                      "Press the button to random you tarot today",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
                Positioned(
                  top: 620,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/cardresult');
                    },
                    child: Text(
                      "Get Started Now!",
                      style: TextStyle(fontSize: 15),
                    ),
                    style: ButtonStyle(backgroundColor:
                        MaterialStateColor.resolveWith(
                            (Set<MaterialState> State) {
                      if (State.contains(MaterialState.hovered))
                        return Color(0xffFEC8D8);
                      return Color(0xffD291BC);
                    })),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   child: Container(
      //     decoration: BoxDecoration(
      //       boxShadow: [
      //         BoxShadow(
      //           blurRadius: 0.0,
      //           color: Color.fromARGB(65, 15, 13, 84),
      //         ),
      //       ],
      //       color: Color.fromRGBO(145, 144, 193, 1),
      //     ),
      //     height: 65,
      //     child: Center(
      //       child: ElevatedButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         style: ElevatedButton.styleFrom(
      //           shadowColor: Color.fromRGBO(145, 144, 193, 0),
      //           backgroundColor: Color.fromRGBO(145, 144, 193, 1),
      //           shape: CircleBorder(),
      //           padding: EdgeInsets.all(2),
      //         ),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             Icon(Icons.home,
      //                 color: Color.fromARGB(255, 255, 255, 255)), // icon
      //             Text(
      //               "Home",
      //               style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      //             ), // text
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
