import 'package:animation_drawer/view_all_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // Apply translation and scaling to the container
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        // RotateZ expects radians, so use a small value for a slight rotation
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Toggle drawer open/close state on tap
                  isDrawerOpen
                      ? GestureDetector(
                          child: const Icon(Icons.arrow_back_ios),
                          onTap: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : GestureDetector(
                          child: const Icon(Icons.menu),
                          onTap: () {
                            setState(() {
                              xOffset = 290;
                              yOffset = 80;
                              isDrawerOpen = true;
                            });
                          },
                        ),
                  const Text(
                    'Animated Drawer',
                    style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(221, 112, 65, 65),
                        decoration: TextDecoration.none),
                  ),
                  Container(), // Placeholder to balance the Row
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text("ViewAll"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ViewAll()));
                  },
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const AnimalGrid(
              image1: 'assets/monkey.png',
              text1: 'Monkey',
              image2: 'assets/fox.png',
              text2: 'Fox',
            ),
            const SizedBox(
              height: 40,
            ),
            const AnimalGrid(
              image1: 'assets/cat.png',
              text1: 'Cat',
              image2: 'assets/dog.png',
              text2: 'Dog',
            ),
            const SizedBox(
              height: 40,
            ),
            const AnimalGrid(
              image1: 'assets/fish.png',
              text1: 'Fish',
              image2: 'assets/turtle.png',
              text2: 'Turtle',
            ),
            const SizedBox(
              height: 40,
            ),
            const AnimalGrid(
              image1: 'assets/bird.png',
              text1: 'Bird',
              image2: 'assets/owl.png',
              text2: 'Owl',
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimalGrid extends StatelessWidget {
  final String image1;
  final String text1;
  final String image2;
  final String text2;

  const AnimalGrid({
    Key? key,
    required this.image1,
    required this.text1,
    required this.image2,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ImageScreen(image: image1, text: text1),
                    );
                  },
                ),
              );
            },
            child: AnimalCard(image: image1, text: text1),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ImageScreen(image: image2, text: text2),
                    );
                  },
                ),
              );
            },
            child: AnimalCard(image: image2, text: text2),
          ),
        ],
      ),
    );
  }
}

class AnimalCard extends StatelessWidget {
  final String image;
  final String text;

  const AnimalCard({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Hero(
              tag: image,
              child: Image(
                height: 100,
                width: 100,
                image: AssetImage(image),
              ),
            ),
          ),
          Text(
            text,
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 15,
                decoration: TextDecoration.none),
          )
        ],
      ),
    );
  }
}

class ImageScreen extends StatelessWidget {
  final String image;
  final String text;

  const ImageScreen({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: image,
              child: Image(
                image: AssetImage(image),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black87,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
