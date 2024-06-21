import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: const Text(
          'Matched Images',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: const ImagePage(),
    );
  }
}

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int leftImage = 5;
  int rightImage = 8;

  void randomImage() {
    leftImage =
        Random().nextInt(9) + 1; //random number generator[0 -> (max - 1)]
    rightImage = Random().nextInt(9) + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImage == rightImage ? 'Congratulation !' : 'Hard luck !',
          style: const TextStyle(fontSize: 40.0, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        randomImage();
                      });
                    },
                    child: Image.asset('images/image-$leftImage.png')),
              ),
              Expanded(
                child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        randomImage();
                      });
                    },
                    child: Image.asset('images/image-$rightImage.png')),
              ),
            ],
          ),
        )
      ],
    );
  }
}
