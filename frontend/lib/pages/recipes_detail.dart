import 'package:flutter/material.dart';
import 'package:frontend/models/home_model.dart';
import 'package:frontend/services/graphql_service.dart';

class RecipesDetailPage extends StatelessWidget {
  const RecipesDetailPage({Key? key, required this.item}) : super(key: key);

  final ReceiptsDatum item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.attributes.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            Image.network(GraphQLService.baseUrl + item.attributes.images.data.first.attributes.url),

            // description
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 16.0, bottom: 8.0),
              child: Text(
                item.attributes.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(item.attributes.description),
            ),

            // ingredients
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Ingredients",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: item.attributes.ingredients.map((item) {
                  return Text(' - ${item.name}');
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
