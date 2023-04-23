import 'package:flutter/material.dart';

class CautionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                  colors: [
                    Color.fromARGB(255, 173, 77, 77),
                    Color.fromARGB(255, 201, 200, 231),
                    Color(0xFFC9C8E7),
                  ],
                  focal: Alignment(0, -3),
                  radius: 6,
                )),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              )),
          Align(
            alignment: Alignment(0, -0.25),
            child: Container(
              width: 350,
              height: 450,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15.0,
                    color: Color.fromARGB(65, 15, 13, 84),
                  ),
                ],
                color: Color.fromARGB(255, 248, 243, 243),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5, top: 25),
                        child: Text(
                          "Caution ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 175, 21, 52)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(22),
                        child: const Text(
                          '\t\t\t\t\t\t\tBefore using this horoscope app, please note that horoscopes are meant to be taken with a grain of salt and should not be relied on for major life decisions.\n\n\t\t\t\t\t\t\tThey are based on generalize and should not be used as a substitute for professional advice. \n\n\t\t\t\t\t\t\tAdditionally, some people may find horoscopes to be inaccurate \nor even offensive. If you are unsure about using this app, we suggest consulting with a licensed professional.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Padding(
              padding: EdgeInsets.only(top: 450),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/for_user');
                },
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    "Accept",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                style: ButtonStyle(backgroundColor:
                    MaterialStateColor.resolveWith((Set<MaterialState> State) {
                  if (State.contains(MaterialState.hovered))
                    return Color(0xffFEC8D8);
                  return Color.fromARGB(255, 175, 21, 52);
                })),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
// import 'package:flutter/material.dart';

// class CautionScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Stack(
//         children: [
//           Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 decoration: const BoxDecoration(
//                     gradient: RadialGradient(
//                   colors: [
//                     Color.fromARGB(255, 173, 77, 77),
//                     Color.fromARGB(255, 201, 200, 231),
//                     Color(0xFFC9C8E7),
//                   ],
//                   focal: Alignment(0, -3),
//                   radius: 6,
//                 )),
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//               )),
//           Align(
//             alignment: Alignment(0, 0),
//             child: Container(
//               // padding: const EdgeInsets.all(25),
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     blurRadius: 15.0,
//                     color: Color.fromARGB(65, 15, 13, 84),
//                   ),
//                 ],
//                 color: Color.fromARGB(255, 248, 243, 243),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               height: MediaQuery.of(context).size.height * 0.75,
//               width: MediaQuery.of(context).size.width * 0.90,
//               child: Expanded(
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.vertical,
//                   child: Column(
//                     // crossAxisAlignment: CrossAxisAlignment.center,
//                     // mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(bottom: 10, top: 40),
//                         child: Text(
//                           "Caution ",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 25,
//                               fontWeight: FontWeight.bold,
//                               color: Color.fromARGB(255, 175, 21, 52)),
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.only(
//                             top: 20, bottom: 20, left: 40, right: 40),
//                         child: Text(
//                           '\t\t\tBefore using this horoscope app, please note that horoscopes are meant to be taken with a grain of salt and should not be relied on for major life decisions. They are based on generalizations and should not be used as a substitute for professional advice. Additionally, some people may find horoscopes to be inaccurate or even offensive. If you are unsure about using this app, we recommend consulting with a licensed professional.',
//                           textAlign: TextAlign.start,
//                           style: TextStyle(
//                             fontStyle: FontStyle.normal,
//                             letterSpacing: 1,
//                             wordSpacing: 1,
//                             fontSize: 18,
//                             fontWeight: FontWeight.normal,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 15),
//                         child: ElevatedButton(
//                           onPressed: () {
//                             Navigator.pushNamed(context, '/for_user');
//                           },
//                           child: Padding(
//                             padding: EdgeInsets.all(12),
//                             child: Text(
//                               "Accept",
//                               style: TextStyle(fontSize: 15),
//                             ),
//                           ),
//                           style: ButtonStyle(backgroundColor:
//                               MaterialStateColor.resolveWith(
//                                   (Set<MaterialState> State) {
//                             if (State.contains(MaterialState.hovered))
//                               return Color(0xffFEC8D8);
//                             // ยังไม่กด
//                             return Color.fromARGB(255, 175, 21, 52);
//                           })),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     )
//         );
//   }
// }
