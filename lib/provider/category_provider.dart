import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {

  /////////////// Dress Category /////////////////
  late Product dressData;
  List<Product> dress = [];

  Future<void> getDressData() async {
    List<Product> newList = [];
    QuerySnapshot dressSnapShot = await Firestore.instance
        .collection("category")
        .document("QVzE8g9M9QBgudGyF5ve")
        .collection("dress")
        .getDocuments();
    dressSnapShot.documents.forEach(
          (element) {
        dressData = Product(
          name: element.data["name"],
          image: element.data["image"],
          price: element.data["price"],
        );
        newList.add(dressData);
      },
    );
    dress = newList;
  }

  List<Product> get getDressList{
    return dress;
  }

  /////////////// Shirt Category /////////////////
  late Product shirtData;
  List<Product> shirt = [];

  Future<void> getShirtData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await Firestore.instance
        .collection("category")
        .document("QVzE8g9M9QBgudGyF5ve")
        .collection("shirt")
        .getDocuments();
    shirtSnapShot.documents.forEach(
      (element) {
        shirtData = Product(
          name: element.data["name"],
          image: element.data["image"],
          price: element.data["price"],
        );
        newList.add(shirtData);
      },
    );
    shirt = newList;
  }

  List<Product> get getShirtList{
    return shirt;
  }

  /////////////// Shoes Category /////////////////
  late Product shoesData;
  List<Product> shoes = [];

  Future<void> getShoesData() async {
    List<Product> newList = [];
    QuerySnapshot shoesSnapShot = await Firestore.instance
        .collection("category")
        .document("QVzE8g9M9QBgudGyF5ve")
        .collection("shoes")
        .getDocuments();
    shoesSnapShot.documents.forEach(
          (element) {
        shoesData = Product(
          name: element.data["name"],
          image: element.data["image"],
          price: element.data["price"],
        );
        newList.add(shoesData);
      },
    );
    shoes = newList;
  }

  List<Product> get getShoesList{
    return shoes;
  }

  /////////////// Pant Category /////////////////
  late Product pantData;
  List<Product> pant = [];

  Future<void> getPantData() async {
    List<Product> newList = [];
    QuerySnapshot pantSnapShot = await Firestore.instance
        .collection("category")
        .document("QVzE8g9M9QBgudGyF5ve")
        .collection("pant")
        .getDocuments();
    pantSnapShot.documents.forEach(
          (element) {
        pantData = Product(
          name: element.data["name"],
          image: element.data["image"],
          price: element.data["price"],
        );
        newList.add(pantData);
      },
    );
    pant = newList;
  }

  List<Product> get getPantList{
    return pant;
  }

  /////////////// Tie Category /////////////////
  late Product tieData;
  List<Product> tie = [];

  Future<void> getTieData() async {
    List<Product> newList = [];
    QuerySnapshot tieSnapShot = await Firestore.instance
        .collection("category")
        .document("QVzE8g9M9QBgudGyF5ve")
        .collection("tie")
        .getDocuments();
    tieSnapShot.documents.forEach(
          (element) {
        tieData = Product(
          name: element.data["name"],
          image: element.data["image"],
          price: element.data["price"],
        );
        newList.add(tieData);
      },
    );
    tie = newList;
  }

  List<Product> get getTieList{
    return tie;
  }

}
