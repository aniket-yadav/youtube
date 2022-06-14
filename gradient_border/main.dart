import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

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
hey everyone , let's see how can we give gradient border to a textfield and image 
you may have see instagram it's showing gradient border around story 
so to do this we will use a plugin 
let's start

thanks  for watching
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          child: Text(
            "Gradient Border",
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Enter your name",
                border: GradientOutlineInputBorder(
                  width: 2.0,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(colors: [Colors.green, Colors.red]),
                ),
              ),
            ),
          ), //that's how you can give gradient border to textfield

          // now lets how to give rounded gradient to a image
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: const GradientBoxBorder(
                gradient: LinearGradient(colors: [
                  Colors.redAccent,
                  Colors.greenAccent,
                  Colors.blue
                ]),
                width: 5,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const Image(
                image: NetworkImage(
                  "https://w0.peakpx.com/wallpaper/331/150/HD-wallpaper-sad-boy-hotaro-art-cartoon-sadboy-dark-hotarooreki-feeling-anime-thumbnail.jpg",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
