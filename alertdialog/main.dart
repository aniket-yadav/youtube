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
            "Alert Dialog",
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Delete Record"),
                          content: const Text("Do you want to delete"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  //  add you delete logic here
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Yes")),
                            TextButton(
                                onPressed: () {
                                  // and just close on no
                                  Navigator.of(context).pop();
                                },
                                child: const Text("No"))
                          ],
                        );
                      });
                },
                child: const Text("Show Dialog")),
          ],
        ),
      ),
    );
  }
}
