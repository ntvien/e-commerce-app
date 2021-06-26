import 'package:e_commerce_app/provider/category_provider.dart';
import 'package:e_commerce_app/provider/product_provider.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/checkout.dart';
import 'package:e_commerce_app/screens/detail_screen.dart';
import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:e_commerce_app/screens/list_product.dart';
import 'package:e_commerce_app/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/screens/signin.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffaf7373),
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Builder(
        builder: (context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ProductProvider>(
                  create: (context) => ProductProvider()),
              ChangeNotifierProvider<CategoryProvider>(
                  create: (context) => CategoryProvider()),
            ],
            child: StreamBuilder(
              stream: FirebaseAuth.instance.onAuthStateChanged,
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return HomeScreen();
                } else {
                  return HomeScreen();
                }
              },
            ),
          );
        },
      ),
    );
  }
}
