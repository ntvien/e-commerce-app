import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/categoryicon.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {
  /////////////// Dress Icon Category /////////////////
  late CategoryIcon dressIconData;
  List<CategoryIcon> dressIcon = [];

  Future<void> getDressIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot dressIconSnapShot =
        await Firestore.instance.collection("categoryicon").
        document("0AAFerqp4Um5oDmJ14Ty").collection("dress").getDocuments();
    dressIconSnapShot.documents.forEach(
      (element) {
        dressIconData = CategoryIcon(
          image: element.data["image"],
        );
        newList.add(dressIconData);
      },
    );
    dressIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getDressIconList {
    return dressIcon;
  }

  /////////////// Shirt Icon Category /////////////////
  late CategoryIcon shirtIconData;
  List<CategoryIcon> shirtIcon = [];

  Future<void> getShirtIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot shirtIconSnapShot =
    await Firestore.instance.collection("categoryicon").
    document("0AAFerqp4Um5oDmJ14Ty").collection("shirt").getDocuments();
    shirtIconSnapShot.documents.forEach(
          (element) {
        shirtIconData = CategoryIcon(
          image: element.data["image"],
        );
        newList.add(shirtIconData);
      },
    );
    shirtIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getShirtIconList {
    return shirtIcon;
  }

  /////////////// Shoes Icon Category /////////////////
  late CategoryIcon shoesIconData;
  List<CategoryIcon> shoesIcon = [];

  Future<void> getShoesIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot shoesIconSnapShot =
    await Firestore.instance.collection("categoryicon").
    document("0AAFerqp4Um5oDmJ14Ty").collection("shoes").getDocuments();
    shoesIconSnapShot.documents.forEach(
          (element) {
        shoesIconData = CategoryIcon(
          image: element.data["image"],
        );
        newList.add(shoesIconData);
      },
    );
    shoesIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getShoesIconList {
    return shoesIcon;
  }

  /////////////// Pant Icon Category /////////////////
  late CategoryIcon pantIconData;
  List<CategoryIcon> pantIcon = [];

  Future<void> getPantIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot pantIconSnapShot =
    await Firestore.instance.collection("categoryicon").
    document("0AAFerqp4Um5oDmJ14Ty").collection("pant").getDocuments();
    pantIconSnapShot.documents.forEach(
          (element) {
        pantIconData = CategoryIcon(
          image: element.data["image"],
        );
        newList.add(pantIconData);
      },
    );
    pantIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getPantIconList {
    return pantIcon;
  }

  /////////////// Tie Icon Category /////////////////
  late CategoryIcon tieIconData;
  List<CategoryIcon> tieIcon = [];

  Future<void> getTieIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot tieIconSnapShot =
    await Firestore.instance.collection("categoryicon").
    document("0AAFerqp4Um5oDmJ14Ty").collection("tie").getDocuments();
    tieIconSnapShot.documents.forEach(
          (element) {
        tieIconData = CategoryIcon(
          image: element.data["image"],
        );
        newList.add(tieIconData);
      },
    );
    tieIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getTieIconList {
    return tieIcon;
  }

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
    notifyListeners();
  }

  List<Product> get getDressList {
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
    notifyListeners();
  }

  List<Product> get getShirtList {
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
    notifyListeners();
  }

  List<Product> get getShoesList {
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
    notifyListeners();
  }

  List<Product> get getPantList {
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
    notifyListeners();
  }

  List<Product> get getTieList {
    return tie;
  }
}
