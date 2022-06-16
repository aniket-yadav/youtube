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
  Hey Everyone let's see how you can animation page transition
  so we are going to see slide animation 
  first let's see UI 
  it's a simple UI with Text and button  to open next screen
  let's animate new screen opening


  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: const FittedBox(
          child: Text(
            "Page Transition",
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
            const Text("Page 1"),
            ElevatedButton(
              onPressed: () {
                //  this is normal code opening screen

                Navigator.of(context).push(
                  PageRouteBuilder(
                      transitionDuration: const Duration(
                          milliseconds: 700), //you can set duration
                      reverseTransitionDuration:
                          const Duration(milliseconds: 700),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const SecondScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0); // initial page position
                        const end = Offset.zero; // last page position
                        const curve = Curves.easeInToLinear; // try whatever you like
                        //  that's it thanks for watching
                        

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      }), // that's it let run it
                );
              },
              child: const Text("Open next Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
