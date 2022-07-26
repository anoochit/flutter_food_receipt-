import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/models/home_model.dart';
import 'package:frontend/services/graphql_service.dart';
import 'package:frontend/services/query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food recipes"),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(readAllRecipts),
          pollInterval: const Duration(seconds: 0),
        ),
        builder: (result, {fetchMore, refetch}) {
          // has error
          if (result.hasException) {
            return const Text("Error");
          }

          // is loading
          if (result.isLoading) {
            return const Text('Loading');
          }

          // is empty
          if (result.data == null) {
            return const Text('No data');
          }

          // is not empty
          if (result.data!.isNotEmpty) {
            final data = result.data;

            final recipts = receiptsFromJson(json.encode(data));
            final reciptsItems = recipts.receipts.data;

            // TODO : should parse this map
            //log('first item : ${recipts!["receipts"]["data"][0]["attributes"]["name"]}');

            return ListView.builder(
              itemCount: reciptsItems.length,
              itemBuilder: (BuildContext context, int index) {
                final id = reciptsItems[index].id;
                final title = reciptsItems[index].attributes.name;
                final image = reciptsItems[index].attributes.images.data.first.attributes.url;
                return ListTile(
                  leading: LayoutBuilder(
                    builder: (context, constraints) {
                      return ClipOval(
                        child: SizedBox(
                          width: constraints.maxHeight,
                          height: constraints.maxHeight,
                          child: Image.network(
                            GraphQLService.baseUrl + image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  title: Text('${title}'),
                  onTap: (() {
                    // show recipes
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => RecipesDetailPage(recipes: item),
                    //   ),
                    // );
                  }),
                );
              },
            );
          }

          // waiting
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
