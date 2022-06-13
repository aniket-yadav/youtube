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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          child: Text(
            "Bottom Sheet",
          ),
        ),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.grey.shade100,
                    constraints: const BoxConstraints(maxHeight: 200),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Enter your age"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: const Text('Show Bottom Sheet')),
        ],
      ),
    );
  }
}
