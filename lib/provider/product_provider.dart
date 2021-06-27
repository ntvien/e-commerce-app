// ignore: import_of_legacy_library_into_null_safe
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/model/cart.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  /////////////// Home Feature /////////////////
  late Product homeFeatureData;
  List<Product> homeFeature = [];

  Future<void> getHomeFeatureData() async {
    List<Product> newList = [];
    QuerySnapshot homeFeatureSnapShot =
        await FirebaseFirestore.instance.collection("homefeature").get();
    homeFeatureSnapShot.docs.forEach(
      (element) {
        homeFeatureData = Product(
          name: element.data()["name"],
          image: element.data()["image"],
          price: element.data()["price"],
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
        await FirebaseFirestore.instance.collection("homeachives").get();
    homeNewAchivesSnapShot.docs.forEach(
      (element) {
        homeNewAchivesData = Product(
          name: element.data()["name"],
          image: element.data()["image"],
          price: element.data()["price"],
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
    QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
        .collection("product")
        .doc("KzDvCVWJ8CQCPlbW21Yq")
        .collection("featureproduct")
        .get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
          name: element.data()["name"],
          image: element.data()["image"],
          price: element.data()["price"],
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
    QuerySnapshot newAchivesSnapShot = await FirebaseFirestore.instance
        .collection("product")
        .doc("KzDvCVWJ8CQCPlbW21Yq")
        .collection("newachives")
        .get();
    newAchivesSnapShot.docs.forEach(
      (element) {
        newAchivesData = Product(
          name: element.data()["name"],
          image: element.data()["image"],
          price: element.data()["price"],
        );
        newList.add(newAchivesData);
      },
    );
    newAchives = newList;
  }

  List<Product> get getNewAchivesList {
    return newAchives;
  }

  /////////////// Cart /////////////////
  List<Cart> cartList = [];
  late Cart cart;

  void getCartData(
      {String? name, String? image, int? quantity, double? price}) {
    cart = Cart(name: name, image: image, quantity: quantity, price: price);
    cartList.add(cart);
  }

  List<Cart> get getCartList {
    return List.from(cartList);
  }

  int get getCartListLength {
    return cartList.length;
  }

  /////////////// CheckOut /////////////////
  List<Cart> checkOutModelList = [];
  late Cart checkOutModel;

  void getCheckOutData({
    int? quantity,
    double? price,
    String? name,
    String? color,
    String? size,
    String? image,
  }) {
    checkOutModel = Cart(
      color: color,
      size: size,
      price: price,
      name: name,
      image: image,
      quantity: quantity,
    );
    checkOutModelList.add(checkOutModel);
  }

  List<Cart> get getCheckOutModelList {
    return List.from(checkOutModelList);
  }

  int get getCheckOutModelListLength {
    return checkOutModelList.length;
  }

  /////////////// Notification /////////////////
  List<String> notificationList = [];

  void addNotification(String notification) {
    notificationList.add(notification);
  }

  int get getNotificationIndex {
    return notificationList.length;
  }

  get getNotificationList {
    return notificationList;
  }
}
