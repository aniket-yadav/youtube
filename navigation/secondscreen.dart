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
      body: Column(
        children: [
          Text("name from first screen $name"),
          Container(
            child: const Text("I am second screen"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(
                    "hi from second screen"); // you can return any data , by just puting it in pop
                // pop will remove this screen from stack
                //  Flutter screen are stack based  that is one above other
                //  when you push a screen it comes on top of current screen
                //  and by poping this new screen you will be back on first one
                //  now let's see how you can pass value from first screen to second
              },
              child: const Text("Close screen")),
        ],
      ),
    );
  }
}
