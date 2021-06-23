import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  /////////////// Home Feature /////////////////
  late Product homeFeatureData;
  List<Product> homeFeature = [];

  Future<void> getHomeFeatureData() async {
    List<Product> newList = [];
    QuerySnapshot homeFeatureSnapShot =
        await Firestore.instance.collection("homefeature").getDocuments();
    homeFeatureSnapShot.documents.forEach(
      (element) {
        homeFeatureData = Product(
          name: element.data["name"],
          image: element.data["image"],
          price: element.data["price"],
        );
        newList.add(homeFeatureData);
      },
    );
    homeFeature = newList;
    notifyListeners();
  }

  List<Product> get getHomeFeatureList {
    return homeFeature;
  }

  /////////////// Home NewAchives /////////////////
  late Product homeNewAchivesData;
  List<Product> homeNewAchives = [];

  Future<void> getHomeNewAchivesData() async {
    List<Product> newList = [];
    QuerySnapshot homeNewAchivesSnapShot =
        await Firestore.instance.collection("homeachives").getDocuments();
    homeNewAchivesSnapShot.documents.forEach(
      (element) {
        homeNewAchivesData = Product(
          name: element.data["name"],
          image: element.data["image"],
          price: element.data["price"],
        );
        newList.add(homeNewAchivesData);
      },
    );
    homeNewAchives = newList;
    notifyListeners();
  }

  List<Product> get getHomeNewAchivesList {
    return homeNewAchives;
  }

  /////////////// Feature /////////////////
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
    notifyListeners();
  }

  List<Product> get getFeatureList {
    return feature;
  }

  /////////////// NewAchives /////////////////
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
    notifyListeners();
  }
}
