// add http plugin 

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  bool _loading = false;
  List<dynamic> _users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          child: Text(
            "API Call",
          ),
        ),
      ),
      body: _users.isNotEmpty
          ? ListView.builder(
              itemCount: _users.length,
              itemBuilder: ((context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10.0,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.network(_users[index]['image']),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_users[index]['firstName']),
                            Text(_users[index]['email']),
                            Text(_users[index]['phone']),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
            )
          : Center(
              child: _loading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      child: const Text("fetch users"),
                      onPressed: loadUserList,
                    ),
            ),
    );
  }

  loadUserList() async {
    setState(() {
      _loading = true;
    });
    var res = await http.get(Uri.https("dummyjson.com", "users"));
    if (res.statusCode == 200) {
      var jsonData = jsonDecode(res.body);
      if (jsonData['users'].isNotEmpty) {
        setState(() {
          _users = jsonData['users'];
          _loading = false;
        });
      }
    }
  }
}
