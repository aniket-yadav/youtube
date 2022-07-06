/*

add plugins
http: ^0.13.4
graphql_flutter: ^5.1.0

*/

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter(); // for cache 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphQL Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'GraphQL Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> characters = [];
  bool _loading = false;

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
                            leading: Image(
                              image: NetworkImage(
                                characters[index]['image'],
                              ),
                            ),
                            title: Text(
                              characters[index]['name'],
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
    HttpLink link =
        HttpLink("https://rickandmortyapi.com/graphql"); 
    GraphQLClient qlClient = GraphQLClient(
      
      link: link,
      cache: GraphQLCache(
        store:
            HiveStore(),
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

// queryResult.data  // contains data
// queryResult.exception // will give what exception you got /errors
// queryResult.hasException // you can check if you have any exception

// queryResult.context.entry<HttpLinkResponseContext>()?.statusCode  // to get status code of response

    setState(() {
      characters = queryResult.data!['characters'][
          'results']; 
      _loading = false;
    });
  }
}
