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
  // menu options
  final List<String> _options = [
    "Filter",
    "Settings",
    "Logout",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Option Menu"),
        actions: [
          PopupMenuButton(
              onSelected: handleClick,
              itemBuilder: (context) {
                return _options.map((e) {
                  return PopupMenuItem(value: e, child: Text(e));
                }).toList();
              })
        ],
      ),
      body: Container(),
    );
  }

  void handleClick(String value) {
    //  you can you switch to perform different action
    switch (value) {
      case "Filter":
        print("Filter selected");
        break;
      case "Settings":
        print("Settings selected");
        break;
      case "Logout":
        print("Logout selected");
        break;
      default:
        print("this will be called if non of above case matched");
    }
  }
}
