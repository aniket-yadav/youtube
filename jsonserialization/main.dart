/*
  http: ^0.13.4
  graphql_flutter: ^5.1.0
  json_serializable: ^6.3.1 
  json_annotation: ^4.6.0 

dev_dependencies:  
  build_runner: ^2.2.0 


*/

import 'package:dummy/characters.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json Serialization',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Json Serialization'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/*

if you see our response is something like this
here as we see we need 3 data clasess to convert this 
if you ever get confuse  in how many data class or class you need just see no of bracket opening /closeing
{ -> 1
  characters:{->2
    results:[
      {->3  always create inner most first
        name:"Aniket",
        image:"http:image.png"
      }
    ]
  }
}

so we are create class class manually or we have plugin to do that
let's see by plugin in this video


*/

class _MyHomePageState extends State<MyHomePage> {
  List<Character> characters = [];
  bool _loading = false;
/*
Hey everyone today we are going to see json serialization/data parsing or json to object
whetever you like to say all are same


i am going to use my one of old video/code where i have  shown you how to use graphql api call

so let's start assuming you have seen that video if not please go and watch

first let's see our response

so we got our data class now let's use them
okay everything done now let see if it working as before
yes it's working
thanks for watching

*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _loading
          ? const CircularProgressIndicator()
          : characters.isEmpty
              ? Center(
                  child: ElevatedButton(
                    child: const Text("Fetch Data"),
                    onPressed: () {
                      fetchData();
                    },
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: characters.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: characters[index].image != null // i am checking for null if this get null value it will break
                                ? Image(
                                    image: NetworkImage(
                                      characters[index].image ?? '',
                                    ),
                                  )
                                : null,
                            title: Text(
                              characters[index].name ?? '',
                            ),
                          ),
                        );
                      }),
                ),
    );
  }

  void fetchData() async {
    setState(() {
      _loading = true;
    });
    HttpLink link = HttpLink("https://rickandmortyapi.com/graphql");
    GraphQLClient qlClient = GraphQLClient(
      link: link,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    );
    QueryResult queryResult = await qlClient.query(
      QueryOptions(
        document: gql(
          """query {
  characters() {
    results {
      name
      image 
    }
  }
  
}""",
        ),
      ),
    );

    print(queryResult.data);

//  here queryResult.data give json to no need to convert it into json or using jsonDecode
//  i am just checking if any error or not and data is not null
    if (!queryResult.hasException && queryResult.data != null) {
      CharactersResponse response =
          CharactersResponse.fromJson(queryResult.data!);
      setState(() {
        characters = response.characters?.results ?? [];

        /// now we can access field like object
        _loading = false;
      });
    }
  }
}
