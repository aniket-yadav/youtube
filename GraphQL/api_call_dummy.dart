// NOTE:
//  here authorization and key field is to just show how you can use.
//  actual api link used here does not support authorization key and api key 

void fetchData() async {
    setState(() {
      _loading = true; 
    });
  
  
   HttpLink httpLink = HttpLink("https://rickandmortyapi.com/graphql");
   AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer ${await SessionManager.getAuthToken()}',
  );

   AuthLink apiKey = AuthLink(
    getToken: () async => await SessionManager.getAPI(),
    headerKey: 'apiKey',
  );
  Link link = authLink.concat(apiKey).concat(httpLink);
  
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
