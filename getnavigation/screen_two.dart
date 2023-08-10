import 'package:flutter/material.dart';
import 'package:get/get.dart'; // you have to import this

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

//  let run first
class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Two"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // to go back use
            Get.back();
            //  now let see samee with name routes
          },
          child: const Text("Go Back"),
        ),
      ),
    );
  }
}
