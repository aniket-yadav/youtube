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
hey everyone , today iam going to show you how to navigation between 2 screen 
also how can you pass data to next screen
and how to return data from 2nd screen to first
so let's start
by screen 2nd screen
now add a button to 

  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const FittedBox(
          child: Text(
            "Navigation",
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //  that's it you can open new screen with Navigator
          //  now let's screen a button in second screen to show how to close screen

          ElevatedButton(
              onPressed: () async {
                //  here i am passing name in parameter to second screen
                //  you can pass any data type you want in same manner
                //  that's it this is how to pass data from first to second screen
                //  now let's see how you can return data from second screen to first

                var res = await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SecondScreen(
                          name: "Aniket",
                        )));
//  i am printing data returnig from second screen
//  that's it for now 
//  thanks for watching

                print(res);
              },
              child: const Text("next screen")),
        ],
      ),
    );
  }
}
