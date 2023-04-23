// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:horovision_project/category.dart';
import 'package:horovision_project/param.dart';
// import 'package:test_api2/param.dart';
// import 'package:test_api2/zodiacResult.dart';
// import 'package:test_api2/category.dart';
// import 'package:test_api2/prophecy.dart';

class Zodiac extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {
      'title': 'Aries',
      'subtitle': 'March 21 - April 19',
      'image': 'assets/photo/aries2.png',
      'param': 'aries',
    },
    {
      'title': 'Taurus',
      'subtitle': 'April 20 - May 20',
      'image': 'assets/photo/taurus2.png',
      'param': 'taurus',
    },
    {
      'title': 'Gemini',
      'subtitle': 'May 21 - June 20',
      'image': 'assets/photo/gemini2.png',
      'param': 'gemini',
    },
    {
      'title': 'Cancer',
      'subtitle': 'June 21 - July 22',
      'image': 'assets/photo/cancer2.png',
      'param': 'cancer',
    },
    {
      'title': 'Leo',
      'subtitle': 'July 23 - August 22',
      'image': 'assets/photo/leo2.png',
      'param': 'leo',
    },
    {
      'title': 'Virgo',
      'subtitle': 'August 23 - September 22',
      'image': 'assets/photo/virgo2.png',
      'param': 'virgo',
    },
    {
      'title': 'Libra',
      'subtitle': 'September 23 - october 22',
      'image': 'assets/photo/libra2.png',
      'param': 'libra',
    },
    {
      'title': 'Scorpio',
      'subtitle': 'Octobor 23 - November 21',
      'image': 'assets/photo/scorpio2.png',
      'param': 'scorpio',
    },
    {
      'title': 'Sagittarius',
      'subtitle': 'November 22 - December 21',
      'image': 'assets/photo/sagittarius2.png',
      'param': 'sagittarius',
    },
    {
      'title': 'Capricorn',
      'subtitle': 'December 22 - January 19',
      'image': 'assets/photo/capricorn2.png',
      'param': 'capricorn',
    },
    {
      'title': 'Aquarius',
      'subtitle': 'January 20 - Febuary 18',
      'image': 'assets/photo/aquarius2.png',
      'param': 'aquarius',
    },
    {
      'title': 'Piscess',
      'subtitle': 'Febuary 19 - March 20',
      'image': 'assets/photo/pisces2.png',
      'param': 'pisces',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Zodiac'),
          backgroundColor: const Color.fromARGB(255, 15, 13, 84),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        body: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        "What's your zodiac ?",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    subtitle: Text(
                      "Please select your zodiac",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: GridView.count(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.7,
                  children: List.generate(
                    data.length,
                    (index) => _buildGridViewItem(context, data[index]),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

Widget _buildGridViewItem(BuildContext context, Map<String, dynamic> item) {
  return Container(
    height: 200,
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(225, 23, 20, 120),
          Color.fromARGB(225, 58, 55, 174),
          Color.fromARGB(225, 86, 84, 184),
          Color.fromARGB(225, 142, 144, 193),
        ],
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, Category.routeName,
            arguments: Param(item['param'], '-', item['title'], '-'));
      },
      //ZodiacResult(param: ModalRoute.of(context)?.settings.arguments, chinesssign: '-', zodiacsign: '-',)
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 70.0,
                height: 100.0,
                decoration: BoxDecoration(
                  
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(item['image']),
                    )),
              )
            ],
          ),
          const SizedBox(height: 5.0),
          Text(
            item['title'],
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: Colors.white),
          ),
          Text(
            item['subtitle'],
            style: const TextStyle(
                fontSize: 8.5,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
