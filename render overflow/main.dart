import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

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
Hey Evryone let see how to solve this yellow black pattern issue
i.e render flow issue
we can solve it in 2 ways
let's see 1st one

okay  now let's see 2nd method to do it
that's all thanks for watching
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  in scaffold
      // resizeToAvoidBottomInset: false, // add this , that's is it solve but remember you can not scroll here
      backgroundColor: const Color.fromARGB(255, 10, 4, 26),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 120),
              alignment: Alignment.center,
              child: const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20.0,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Username",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 45,
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 45,
                    child: const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Login"),
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
