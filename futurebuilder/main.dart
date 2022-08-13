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
  //  here we have to variable one for loading state and other for storing users
  //  we dont's need it in futurebuilder

  /*

Hey everyone today we are going to see how to use futurebuilder 
future builder uses future to build widgets
that means - you call api or anyother data process which  will take somw time then use that data to build ui
for this we will use our api calling code

i am going to change this code with future builder
first let's see how it works currently
we got a button on click of that a api call occur and we get a users list 
okay it's looking bad
okay let's start implementing futurebuilder

it's done 
thanks for watching
  */

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
        body: FutureBuilder<List>(
            future: loadUserList(), // user future goes here ,
            builder: (context, snapshot) {
              //  your data will be in snapshot
              //  to access it you need to use snapshot.data

              //  future builder provides state to check if data is being load or loading or error happened
              // connectionState gives state like waiting ,done active etc
              // done means data is loaded or process is done , waiting means it's loading
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                  height: 40,
                                  child: Image.network(
                                      snapshot.data?[index]['image'])),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data?[index]['firstName']),
                                  Text(snapshot.data?[index]['email']),
                                  Text(snapshot.data?[index]['phone']),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                // waiting state means loading
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                // you can also handle error like this
                return Container(
                  alignment: Alignment.center,
                  child: const Text("Something went wrong"),
                );
              } else {
                return Container();
              }
            }));
  }

  Future<List> loadUserList() async {
    // here we are going api with http plugin
    var res = await http.get(Uri.https(
        "dummyjson.com", "users")); // url -: https://dummyjson.com/users
    var jsonData = jsonDecode(res.body);
    return jsonData['users'];
  }
}
