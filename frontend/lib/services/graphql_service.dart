import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLService {
  static String baseUrl = 'http://10.0.2.2:1337';

  static HttpLink httpLink = HttpLink(
    'http://10.0.2.2:1337/graphql?populate=*',
  );

  static ValueNotifier<GraphQLClient> clientToQuery() {
    return ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(
          store: InMemoryStore(),
        ),
        link: httpLink,
      ),
    );
  }
}
