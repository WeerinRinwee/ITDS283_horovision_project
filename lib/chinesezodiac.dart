import 'package:flutter/material.dart';

import 'param.dart';
import 'show_info_chinese.dart';

// ignore: use_key_in_widget_constructors
class Chinesezodiac extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {
      'title': 'Rat',
      'subtitle': 'Subtitle for Item 1',
      'image': 'assets/photo/rat_zodiac.png',
      'param': 'rat'
    },
    {
      'title': 'Cow',
      'subtitle': 'Subtitle for Item 2',
      'image': 'assets/photo/cow_zodiac.png',
      'param': 'cow'
    },
    {
      'title': 'Tiger',
      'subtitle': 'Subtitle for Item 3',
      'image': 'assets/photo/tiger_zodiac.png',
      'param': 'tiger'
    },
    {
      'title': 'Rabbit',
      'subtitle': 'Subtitle for Item 4',
      'image': 'assets/photo/rabbit_zodiac.png',
      'param': 'rabbit'
    },
    {
      'title': 'Dragon',
      'subtitle': 'Subtitle for Item 5',
      'image': 'assets/photo/dragon_zodiac.png',
      'param': 'dragon'
    },
    {
      'title': 'Snake',
      'subtitle': 'Subtitle for Item 6',
      'image': 'assets/photo/snake_zodiac.png',
      'param': 'snake'
    },
    {
      'title': 'Horse',
      'subtitle': 'Subtitle for Item 6',
      'image': 'assets/photo/horse_zodiac.png',
      'param': 'horse'
    },
    {
      'title': 'Goat',
      'subtitle': 'Subtitle for Item 6',
      'image': 'assets/photo/goat_zodiac.png',
      'param': 'goat'
    },
    {
      'title': 'Monkey',
      'subtitle': 'Subtitle for Item 6',
      'image': 'assets/photo/monkey_zodiac.png',
      'param': 'monkey'
    },
    {
      'title': 'Rooster',
      'subtitle': 'Subtitle for Item 6',
      'image': 'assets/photo/rooster_zodiac.png',
      'param': 'rooster'
    },
    {
      'title': 'Dog',
      'subtitle': 'Subtitle for Item 6',
      'image': 'assets/photo/dog_zodiac.png',
      'param': 'dog'
    },
    {
      'title': 'Pig',
      'subtitle': 'Subtitle for Item 6',
      'image': 'assets/photo/pig_zodiac.png',
      'param': 'pig'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chinese Zodiac'),
          backgroundColor: const Color.fromARGB(255, 138, 116, 146),
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
              color: const Color.fromARGB(255, 255, 246, 217),
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
                color: const Color.fromARGB(255, 255, 246, 217),
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
      // color: const Color.fromARGB(255, 92, 102, 141),
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(225, 185, 164, 192),
          Color.fromARGB(225, 144, 112, 156),
          Color.fromARGB(225, 144, 112, 156),
          Color.fromARGB(225, 120, 89, 132),
        ],
      ),
      // border: Border.all(color: Color.fromARGB(0, 0, 0, 0)),
      borderRadius: BorderRadius.circular(10),
    ),
    child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, Show_info_chinese.routeName,
            arguments: Param('-', item['param'], item['title'], '-'));
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
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5.0,
                        color: Color.fromARGB(133, 92, 68, 101),
                      ),
                    ],
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
