import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

class GraphQLService {
  static String baseUrl = 'http://10.0.2.2:1337';

  static HttpLink httpLink = HttpLink(
    'http://10.0.2.2:1337/graphql?populate=*',
  );

  static ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(
        store: InMemoryStore(),
      ),
      link: httpLink,
    ),
  );

  static ValueNotifier<GraphQLClient> clientToQuery() {
    return client;
  }
}

String readRecipts = """
query {
  receipts {
    data {
      id
      attributes {
        name
        description
        images {
          data {
            attributes {
              url
            }
          }
        }
        ingredients {
          id
          name
        }
      }
    }
  }
}
""";
