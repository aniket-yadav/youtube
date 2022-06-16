import 'package:dummy/screen2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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
  /*
Hey evryone let's see how to navigate between screen
i have already created UI 

  */

  final TextEditingController _editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          child: Text(
            "Navigation",
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Message",
                ),
                controller: _editingController,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                String message = _editingController.text.trim();
                //  let's see how to open next screen
                //  now how to pass data from one screen to next
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SecondScreen(name: message)));
                    //  that's how you move to next screen

              },
              child: const Text("next screen"),
            ),
          ],
        ),
      ),
    );
  }
}
