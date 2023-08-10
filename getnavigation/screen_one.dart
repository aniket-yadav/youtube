import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen One"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //  to navigate to next you just have to use
            // Get.to(const ScreenTwo()); // done , see how simple
            // for named route
            Get.toNamed("/two");
            //  to see all the navigation method just CTR click on
            //  that's it for today thanks for watching
          },
          child: const Text("Open Screen Two"),
        ),
      ),
    );
  }
}
