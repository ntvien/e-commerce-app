// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/category_icon_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider with ChangeNotifier {

  /////////////// Camera First Icon Category /////////////////
  late CategoryIcon cameraFirstIconData;
  List<CategoryIcon> cameraFirstIcon = [];

  Future<void> getCameraFirstIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot cameraFirstIconSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("shjNJJfwmenqOIGmADa7")
        .collection("camera")
        .get();
    cameraFirstIconSnapShot.docs.forEach(
          (element) {
            cameraFirstIconData = CategoryIcon(
          image: element.data()["image"],
        );
        newList.add(cameraFirstIconData);
      },
    );
    cameraFirstIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getCameraFirstIconList {
    return cameraFirstIcon;
  }

  /////////////// Shoes First Icon Category /////////////////
  late CategoryIcon shoesFirstIconData;
  List<CategoryIcon> shoesFirstIcon = [];

  Future<void> getShoesFirstIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot shoesFirstIconSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("shjNJJfwmenqOIGmADa7")
        .collection("shoes")
        .get();
    shoesFirstIconSnapShot.docs.forEach(
          (element) {
        shoesFirstIconData = CategoryIcon(
          image: element.data()["image"],
        );
        newList.add(shoesFirstIconData);
      },
    );
    shoesFirstIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getShoesFirstIconList {
    return shoesFirstIcon;
  }

  /////////////// Watch First Icon Category /////////////////
  late CategoryIcon watchFirstIconData;
  List<CategoryIcon> watchFirstIcon = [];

  Future<void> getWatchFirstIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot watchFirstIconSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("shjNJJfwmenqOIGmADa7")
        .collection("watch")
        .get();
    watchFirstIconSnapShot.docs.forEach(
          (element) {
        watchFirstIconData = CategoryIcon(
          image: element.data()["image"],
        );
        newList.add(watchFirstIconData);
      },
    );
    watchFirstIcon = newList;
    notifyListeners();
  }

  List<CategoryIcon> get getWatchFirstIconList {
    return watchFirstIcon;
  }

  /////////////// Dress Icon Category /////////////////
  late CategoryIcon dressIconData;
  List<CategoryIcon> dressIcon = [];

  Future<void> getDressIconData() async {
    List<CategoryIcon> newList = [];
    QuerySnapshot dressIconSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("0AAFerqp4Um5oDmJ14Ty")
        .collection("dress")
        .get();
    dressIconSnapShot.docs.forEach(
      (element) {
        dressIconData = CategoryIcon(
          image: element.data()["image"],
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
    QuerySnapshot shirtIconSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("0AAFerqp4Um5oDmJ14Ty")
        .collection("shirt")
        .get();
    shirtIconSnapShot.docs.forEach(
      (element) {
        shirtIconData = CategoryIcon(
          image: element.data()["image"],
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
    QuerySnapshot shoesIconSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("0AAFerqp4Um5oDmJ14Ty")
        .collection("shoes")
        .get();
    shoesIconSnapShot.docs.forEach(
      (element) {
        shoesIconData = CategoryIcon(
          image: element.data()["image"],
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
    QuerySnapshot pantIconSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("0AAFerqp4Um5oDmJ14Ty")
        .collection("pant")
        .get();
    pantIconSnapShot.docs.forEach(
      (element) {
        pantIconData = CategoryIcon(
          image: element.data()["image"],
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
    QuerySnapshot tieIconSnapShot = await FirebaseFirestore.instance
        .collection("categoryicon")
        .doc("0AAFerqp4Um5oDmJ14Ty")
        .collection("tie")
        .get();
    tieIconSnapShot.docs.forEach(
      (element) {
        tieIconData = CategoryIcon(
          image: element.data()["image"],
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
    QuerySnapshot dressSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("QVzE8g9M9QBgudGyF5ve")
        .collection("dress")
        .get();
    dressSnapShot.docs.forEach(
      (element) {
        dressData = Product(
          name: element.data()["name"],
          image: element.data()["image"],
          price: element.data()["price"],
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
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("QVzE8g9M9QBgudGyF5ve")
        .collection("shirt")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(
          name: element.data()["name"],
          image: element.data()["image"],
          price: element.data()["price"],
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
    QuerySnapshot shoesSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("QVzE8g9M9QBgudGyF5ve")
        .collection("shoes")
        .get();
    shoesSnapShot.docs.forEach(
      (element) {
        shoesData = Product(
          name: element.data()["name"],
          image: element.data()["image"],
          price: element.data()["price"],
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
    QuerySnapshot pantSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("QVzE8g9M9QBgudGyF5ve")
        .collection("pant")
        .get();
    pantSnapShot.docs.forEach(
      (element) {
        pantData = Product(
          name: element.data()["name"],
          image: element.data()["image"],
          price: element.data()["price"],
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
    QuerySnapshot tieSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("QVzE8g9M9QBgudGyF5ve")
        .collection("tie")
        .get();
    tieSnapShot.docs.forEach(
      (element) {
        tieData = Product(
          name: element.data()["name"],
          image: element.data()["image"],
          price: element.data()["price"],
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

  /////////////// Search Category /////////////////
  List<Product> searchList = [];
  void getSearchList({List<Product>? list}) {
    searchList = list!;
  }

  List<Product> searchCategoryList(String query) {
    List<Product> searchCategory = searchList.where((element) {
      return element.name.toUpperCase().contains(query) ||
          element.name.toLowerCase().contains(query);
    }).toList();
    return searchCategory;
  }

}
