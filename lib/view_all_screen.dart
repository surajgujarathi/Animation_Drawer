import 'package:flutter/material.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({super.key});

  final List<Map<String, String>> items = const [
    {'image': 'assets/bird.png', 'text': 'Bird'},
    {'image': 'assets/cat.png', 'text': 'Cat'},
    {'image': 'assets/dog.png', 'text': 'Dog'},
    {'image': 'assets/fish.png', 'text': 'Fish'},
    {'image': 'assets/monkey.png', 'text': 'Monkey'},
    {'image': 'assets/owl.png', 'text': 'Owl'},
    {'image': 'assets/turtle.png', 'text': 'Turtle'},
    {'image': 'assets/fox.png', 'text': 'Fox'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListWheelScrollView(
          itemExtent: 250,
          children: items.map((item) {
            return Container(
              height: 350,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(item['image']!,height: 100,),
                  const SizedBox(height: 10),
                  Text(
                    item['text']!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}