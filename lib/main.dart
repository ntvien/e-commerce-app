import 'package:e_commerce_app/provider/category_provider.dart';
import 'package:e_commerce_app/provider/product_provider.dart';
import 'package:e_commerce_app/screens/cartscreen.dart';
import 'package:e_commerce_app/screens/checkout.dart';
import 'package:e_commerce_app/screens/detailscreen.dart';
import 'package:e_commerce_app/screens/homepage.dart';
import 'package:e_commerce_app/screens/listproduct.dart';
import 'package:e_commerce_app/screens/welcomescreen.dart';
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<ProductProvider>(create: (context) => ProductProvider()),
          ChangeNotifierProvider<CategoryProvider>(create: (context) => CategoryProvider()),
        ],
        child: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, snapShot) {
            if (snapShot.hasData) {
              return HomePage();
            } else {
              return HomePage();
            }
          },
        ),
      ),
    );
  }
}
