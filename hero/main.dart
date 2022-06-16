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
hey everyone let's see how to animate a widget across two screen
with Hero
i have already created UI let's first see it
okay now let's animate it
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          child: Text(
            "Hero",
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
            //  you have to wrap your widget with Hero widget and give it a tag
            //  that's all you have to do now let's see
            //  like this youe can animate any widget you want
            // thanks for watching
            const Hero(
              tag: "Zoro",
              child: Image(
                image: NetworkImage(
                    "https://i.pinimg.com/originals/3a/bd/73/3abd731ea1a036bbab68e33aa9305434.jpg"),
                height: 100,
                width: 100,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondScreen()));
                },
                child: const Text("Open next Screen")),
          ],
        ),
      ),
    );
  }
}
