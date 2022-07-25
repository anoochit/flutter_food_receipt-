import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/services/graphql_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food recipts"),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(readRecipts),
          pollInterval: Duration(seconds: 0),
        ),
        builder: (result, {fetchMore, refetch}) {
          if (result.hasException) {
            return const Text("Error");
          }

          if (result.isLoading) {
            return const Text('Loading');
          }

          if (result.data == null) {
            return const Text('No data');
          }

          if (result.data!.isNotEmpty) {
            final recipts = result.data;

            log('first item : ${recipts!["receipts"]["data"][0]["attributes"]["name"]}');

            return ListView.builder(
              itemCount: recipts.length,
              itemBuilder: (BuildContext context, int index) {
                final id = recipts["receipts"]["data"][index]["id"];
                final title = recipts["receipts"]["data"][index]["attributes"]["name"];
                final image =
                    recipts["receipts"]["data"][index]["attributes"]["images"]["data"][0]["attributes"]["url"];
                return ListTile(
                  leading: LayoutBuilder(builder: (context, constraints) {
                    return ClipOval(
                      child: Container(
                          width: constraints.maxHeight,
                          height: constraints.maxHeight,
                          child: Image.network(
                            GraphQLService.baseUrl + image,
                            fit: BoxFit.cover,
                          )),
                    );
                  }),
                  title: Text('${title}'),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
