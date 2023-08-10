/*
Add plugin to pubspec.yaml
  get: ^4.6.5


*/

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gexnavigation/screen_one.dart';
import 'package:gexnavigation/screen_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

/*

Hey everyone , Today we will how to use Get navigation 
doing navigation with Get plugin is very easy to let's let started
with installing plugin




*/

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //  TO use Get navigation we have to replace MaterialApp with GetMaterialApp
      // that's it now we can do navigation
      //  I have here 2 screen
      //  while it's running let me explain existing code we have 2 screen i'll navigation from one to screen two

      routes: {
        "/": (_) =>
            const ScreenOne(), // '/' is default route ,or first screen to be shown when app runs
        "/two": (_) => const ScreenTwo(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const ScreenOne(), // remove this now
    );
  }
}
