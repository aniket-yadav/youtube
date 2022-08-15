//  sqflite: ^2.0.3+1
//   path: ^1.8.1
// 
// 
import 'package:dummy/db_helper.dart';
import 'package:dummy/todo_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),

      // here a have given a these to my app it just have theme for textfield
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 15.0,
          ),
          fillColor: Colors.white,
          labelStyle: const TextStyle(
            color: Color(0xFF404040),
            fontSize: 14,
          ),
          hintStyle: const TextStyle(
            color: Color(0x66404040),
            fontSize: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: const BorderSide(
              color: Color(0x70707066),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: const BorderSide(
              color: Color(0x70707066),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.0,
            ),
            borderSide: const BorderSide(
              color: Color(0x70707066),
            ),
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //  2 textfield for label and desc of todo
  final TextEditingController labelController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final dbHelper = DBHelper.instance; // create instance of you dbhelper

  TODO? _todo; // i created this field to use it in for update

/*

Hey Everyone , today we are going to make TODO List
and i will use sqlite db to store data
so when to use a database in our app?

1-> when you need persistant data that means your data should be available when user return again

you got many options to store these persistant data for eg sharedpreferences
but we use shared preferences to store only few keyvalue pair data only
but if you need some what bigger data storage you have to use a database

now question is when to use a local DB or a remote/on server database
see if you want your data to be secured on your server and want to persist event after your app gets uninstalled on your user's device
then you should go for remote database/server DB
else if you want a todo type app where you just want your user's data to persist but not even after they uninstalled it then go for
sqllite db

in this eg i am going to make a todo list with crud operation and i am using sqflite plugin

okay let's start with UI

okay now let's see what we need to do for sqlite 

first of all we are using DBHelper that means we will uses more readable methods to to crud than writing sql statement

and you need to create datamodel of your table 
here my table is todo
so i have created a TODO model let's see it

  now you have see data model db helper ui now let's see them in action/working 
  with this we completed create / read / and update now one more update and then delete
  that all thank for watching
  
*/

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const FittedBox(
            child: Text(
              "TODO List",
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: TextField(
                controller: labelController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "Label",
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10,
              ),
              child: TextField(
                controller: descController,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: "description",
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context)
                      .requestFocus(FocusNode()); //this to close keyboard
                  final label = labelController.text.trim();
                  final desc = descController.text.trim();
                  if (label.isEmpty) {
                    // label is mandatory
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Label can not be empty"),
                      ),
                    );
                    return;
                  }
//  i am doing update and add in same to
                  if (_todo != null) { // here on update button click checking if _todo is no null
                    //  this if part if for update
                    //  assigning new values to _todo's label and desc
                    _todo?.label = label;
                    _todo?.desc = desc;

//  and passing this _todo to updateTODO of dbhelper
                    dbHelper.updateTodo(_todo!).then((value) {
                      //  after execution
                      //  clearing textfield data and _todo to null
                      labelController.value = TextEditingValue.empty;
                      descController.value = TextEditingValue.empty;
                      setState(() {
                        _todo = null;
                      });
                    });
                  } else {
                    //  this part for insert
                    //  so you fill label and desc now you click on add button this will execute this section
                    //  creating a TODO object with label and desc and current datetime
                    dbHelper
                        .insertTodo(
                      TODO(
                        date: DateTime.now().toIso8601String(),
                        desc: desc,
                        label: label,
                      ),
                    )
                        .then((value) {
                      //  after executing clearing field and
                      labelController.value = TextEditingValue.empty;
                      descController.value = TextEditingValue.empty;
                      setState(() {}); // this is to refresh screen
                      // now let's see update
                    });
                  }
                },
                child: Text(_todo != null ? "Update" : "Add"),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: const Text(
                "Todo List",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<TODO>>(
                // useing future builder and listview to show list of todos
                future: dbHelper.todos(), // this is to call/get all todos , this is our read method
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Container(
                        alignment: Alignment.topCenter,
                        child: const Text("Nothing to show"),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              //  on click of these listiitem i am showing a alert dialog
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title:
                                        Text(snapshot.data?[index].label ?? ''),
                                    content:
                                        Text(snapshot.data?[index].desc ?? ''),
                                    actions: [
                                      //  got 2 action on this first to  mark done and
                                      if (snapshot.data?[index].isComplete != 1)
                                        TextButton(
                                          onPressed: () {
                                            //  mark done is also a update , when you click on it 
                                            var temp = snapshot.data?[index];
                                            temp?.isComplete = 1;// i am making isComplete to 1 from 0 , which is default value
                                            //  by the way this sqflite does not support bool so you 0, 1 for bool
                                            // like i did here
                                            if (temp != null) {
                                              dbHelper
                                                  .updateTodo(temp)
                                                  .then((value) {
                                                Navigator.of(context).pop();
                                                setState(() {});
                                              });
                                            }
                                          },
                                          child: const Text("Mark Done"),
                                        ),
                                      //  edit
                                      if (snapshot.data?[index].isComplete != 1)
                                        TextButton(
                                          onPressed: () {
                                            //  when you click on update here i am assiging  current data to our _todo variable 

                                            setState(() {
                                              _todo = snapshot.data?[index];
                                              //  and label and desc value to textfield
                                              labelController.text =
                                                  snapshot.data?[index].label ??
                                                      '';
                                              descController.text =
                                                  snapshot.data?[index].desc ??
                                                      '';
                                              Navigator.of(context).pop(); // and closing alert dialog
                                            });
                                          },
                                          child: const Text("Edit"),
                                        ),
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 15.0,
                                  vertical: 7.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x1100000D),
                                      blurRadius: 16,
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    //  on item we only show label and a delete icon
                                    //  you can click this to see alert
                                    Flexible(
                                      flex: 0,
                                      child: Text(
                                          snapshot.data?[index].label ?? '',
                                          style: TextStyle(
                                            decoration: snapshot.data?[index]
                                                        .isComplete ==
                                                    1
                                                ? TextDecoration.lineThrough
                                                : null,
                                          )),
                                    ),
                                    const Spacer(),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        //  finally delete
                                        //  ondelete i am just passing id
                                        dbHelper
                                            .deleteTodo(
                                                snapshot.data?[index].id ?? -1)
                                            .then((value) {
                                          setState(() {});
                                        });
                                      },
                                      child: const Icon(
                                        Icons.delete_forever,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      alignment: Alignment.center,
                      child: const Text("Something went wrong"),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
