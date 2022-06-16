import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String name;
  const SecondScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Message from Home Screen:- $name"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                //  now let's see how to close this screen
                Navigator.of(context).pop();
              },
              child: const Text("Close screen"),
            ),
          ],
        ),
      ),
    );
  }
}
