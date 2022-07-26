// To parse this JSON data, do
//
//     final receipts = receiptsFromJson(jsonString);

//import 'package:meta/meta.dart';
import 'dart:convert';

Receipts receiptsFromJson(String str) => Receipts.fromJson(json.decode(str));

String receiptsToJson(Receipts data) => json.encode(data.toJson());

class Receipts {
  Receipts({
    required this.typename,
    required this.receipts,
  });

  String typename;
  ReceiptsClass receipts;

  factory Receipts.fromJson(Map<String, dynamic> json) => Receipts(
        typename: json["__typename"],
        receipts: ReceiptsClass.fromJson(json["receipts"]),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "receipts": receipts.toJson(),
      };
}

class ReceiptsClass {
  ReceiptsClass({
    required this.typename,
    required this.data,
  });

  String typename;
  List<ReceiptsDatum> data;

  factory ReceiptsClass.fromJson(Map<String, dynamic> json) => ReceiptsClass(
        typename: json["__typename"],
        data: List<ReceiptsDatum>.from(json["data"].map((x) => ReceiptsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ReceiptsDatum {
  ReceiptsDatum({
    required this.typename,
    required this.id,
    required this.attributes,
  });

  String typename;
  String id;
  PurpleAttributes attributes;

  factory ReceiptsDatum.fromJson(Map<String, dynamic> json) => ReceiptsDatum(
        typename: json["__typename"],
        id: json["id"],
        attributes: PurpleAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class PurpleAttributes {
  PurpleAttributes({
    required this.typename,
    required this.name,
    required this.description,
    required this.images,
    required this.ingredients,
  });

  String typename;
  String name;
  String description;
  Images images;
  List<Ingredient> ingredients;

  factory PurpleAttributes.fromJson(Map<String, dynamic> json) => PurpleAttributes(
        typename: json["__typename"],
        name: json["name"],
        description: json["description"],
        images: Images.fromJson(json["images"]),
        ingredients: List<Ingredient>.from(json["ingredients"].map((x) => Ingredient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "name": name,
        "description": description,
        "images": images.toJson(),
        "ingredients": List<dynamic>.from(ingredients.map((x) => x.toJson())),
      };
}

class Images {
  Images({
    required this.typename,
    required this.data,
  });

  String typename;
  List<ImagesDatum> data;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        typename: json["__typename"],
        data: List<ImagesDatum>.from(json["data"].map((x) => ImagesDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ImagesDatum {
  ImagesDatum({
    required this.typename,
    required this.attributes,
  });

  String typename;
  FluffyAttributes attributes;

  factory ImagesDatum.fromJson(Map<String, dynamic> json) => ImagesDatum(
        typename: json["__typename"],
        attributes: FluffyAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "attributes": attributes.toJson(),
      };
}

class FluffyAttributes {
  FluffyAttributes({
    required this.typename,
    required this.url,
  });

  String typename;
  String url;

  factory FluffyAttributes.fromJson(Map<String, dynamic> json) => FluffyAttributes(
        typename: json["__typename"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "url": url,
      };
}

class Ingredient {
  Ingredient({
    required this.typename,
    required this.id,
    required this.name,
  });

  String typename;
  String id;
  String name;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        typename: json["__typename"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "__typename": typename,
        "id": id,
        "name": name,
      };
}
