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
              "Snackbar View",
            ),
          ),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Show Message"),
            onPressed: showMessage,
          ),
        ));
  }

  void showMessage() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Hi, I am snackbar"),
    ));
  }
}
