import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SpinTheWheel(),
    );
  }
}

class SpinTheWheel extends StatefulWidget {
  const SpinTheWheel({super.key});

  @override
  State<SpinTheWheel> createState() => SpinTheWheelState();
}

class SpinTheWheelState extends State<SpinTheWheel> {
  double turns = 0.0;
  Random random = Random();
  int rotation = 1;
  int luck = 0;
  void _changeRotation() {
    rotation++;
    luck = random.nextInt(10);
    setState(() => turns = (10 * rotation) + ((luck % 10) / 10));
  }

  List<String> options = [
    "Jackpot",
    "200",
    "500",
    "Lose",
    "100",
    "1000",
    "200",
    "500",
    "Lose",
    "100",
  ];

  String selected = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF030307),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Transform.translate(
            offset: const Offset(0, 80),
            child: const Image(
              image: AssetImage("assets/bottom_arrow.png"),
              height: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 10,
            ),
            child: AnimatedRotation(
              onEnd: () {
                setState(() {
                  selected = options[luck % 10];
                });
              },
              turns: turns,
              duration: const Duration(seconds: 1),
              child: const Image(
                image: AssetImage("assets/wheel.png"),
                height: 400,
                width: 400,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (selected.isNotEmpty)
            Text(
              "You Got : $selected",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ElevatedButton(
            onPressed: _changeRotation,
            child: const Text('Spin'),
          ),
        ],
      ),
    );
  }
}
