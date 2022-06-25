
// add numberpicker plugin first

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.grey.shade200,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                  ),
                  alignment: Alignment.center,
                  height: 40,
                ),
                Positioned(
                    child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                        offset: const Offset(
                          0.0,
                          0.0,
                        ),
                      ),
                    ],
                  ),
                )),
                Container(
                  alignment: Alignment.center,
                  child: NumberPicker(
                    axis: Axis.horizontal,
                    itemHeight: 45,
                    itemWidth: 45.0,
                    step: 1,
                    selectedTextStyle: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                    itemCount: 7,
                    value: _currentValue,
                    minValue: 0,
                    maxValue: 100,
                    onChanged: (v) {
                      setState(() {
                        _currentValue = v;
                      });
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Text(
                "Selected Value:- $_currentValue",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
