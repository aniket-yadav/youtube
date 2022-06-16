import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            //  wrap both the widget in both screen
            Hero(
              tag: "Zoro",
              child: Image(
                image: NetworkImage(
                    "https://i.pinimg.com/originals/3a/bd/73/3abd731ea1a036bbab68e33aa9305434.jpg"),
                height: 300,
                width: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
