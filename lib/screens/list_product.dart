import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/screens/home_screen.dart';
import 'package:e_commerce_app/widgets/single_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final String? name;
  List<Product>? snapShot = [];
  ListProduct({this.name, this.snapShot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 30,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name!,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 550,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    scrollDirection: Axis.vertical,
                    children: snapShot!
                        .map(
                          (element) => SingleProduct(
                            image: element.image,
                            name: element.name,
                            price: element.price,
                          ),
                        )
                        .toList(),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
