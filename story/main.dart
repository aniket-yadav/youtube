/*

story_view: ^0.14.0 # add this plugin

https://pub.dev/packages/story_view

*/


import 'package:flutter/material.dart';
import 'package:flutterdemo/story_screen.dart';
import 'package:story_view/story_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

/*

Hi everyone , today we will see how to show status like whatsapp or story like instagram

first let's see demo then we will see code
okay now let's see how to build this
first plugin
so flow for this demo is when you click on this image it open a screen with these image and video which shows them as story with story widget

so let's see data first


thanks for watching 
please like and subcribe

*/

class _HomeState extends State<Home> {
  final controller = StoryController(); // controller 
  List<StoryItem> storyItems = []; // empty story item list , storyitem can be video/image etc
  @override
  void initState() {
    storyItems = [
      StoryItem.pageImage(
        url: 'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg',
        controller: controller,
      ),
      StoryItem.pageImage(
        url: 'https://images.unsplash.com/photo-1616578492900-ea5a8fc6c341',
        controller: controller,
      ),
      StoryItem.pageImage(
        url: 'https://images.unsplash.com/photo-1604311795833-25e1d5c128c6',
        controller: controller,
      ),
      StoryItem.pageVideo(
        'https://static.videezy.com/system/resources/previews/000/049/065/original/Sequence-05.mp4',
        controller: controller,
      ),
      StoryItem.pageVideo(
        'https://static.videezy.com/system/resources/previews/000/047/810/original/Christmas_Decoration_42.mp4',
        controller: controller,
      ),
    ]; // we got 3 images and 2 video here

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Story Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          //  this is our image which you can see 
          GestureDetector(
            onTap: () {
              //  on click open StoryScreen with controller and storyItems
              //  now lets see our storyscreen 
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StoryScreen(
                      controller: controller, storyItems: storyItems),
                ),
              );
            },
            child: const Center(
              child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/aniket.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
