import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {

  /////////////// Feature Category /////////////////
  late Product featureData;
  List<Product> feature = [];

  Future<void> getFeatureData() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot = await Firestore.instance
        .collection("product")
        .document("KzDvCVWJ8CQCPlbW21Yq")
        .collection("featureproduct")
        .getDocuments();
    featureSnapShot.documents.forEach(
      (element) {
        featureData = Product(
          name: element.data["name"],
          image: element.data["image"],
          price: element.data["price"],
        );
        newList.add(featureData);
      },
    );
    feature = newList;
  }

  List<Product> get getFeatureList {
    return feature;
  }

  /////////////// NewAchives Category /////////////////
  late Product newAchivesData;
  List<Product> newAchives = [];

  Future<void> getNewAchivesData() async {
    List<Product> newList = [];
    QuerySnapshot newAchivesSnapShot = await Firestore.instance
        .collection("product")
        .document("KzDvCVWJ8CQCPlbW21Yq")
        .collection("newachives")
        .getDocuments();
    newAchivesSnapShot.documents.forEach(
          (element) {
        newAchivesData = Product(
          name: element.data["name"],
          image: element.data["image"],
          price: element.data["price"],
        );
        newList.add(newAchivesData);
      },
    );
    newAchives = newList;
  }

  List<Product> get getNewAchivesList {
    return newAchives;
  }

}
