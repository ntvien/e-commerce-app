import 'package:e_commerce_app/screens/homepage.dart';
import 'package:e_commerce_app/widgets/singleproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final String? name;
  ListProduct({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (ctx) => HomePage()),
            );
          },
        ),
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
                    mainAxisSpacing: 20,
                    childAspectRatio: 0.7,
                    crossAxisCount: 2,
                    scrollDirection: Axis.vertical,
                    children: [
                      SingleProduct(
                          image: "women.jpg",
                          name: "Women Long T-Shirt",
                          price: 30.0),
                      SingleProduct(
                          image: "women.jpg",
                          name: "Women Long T-Shirt",
                          price: 30.0),
                      SingleProduct(
                          image: "women.jpg",
                          name: "Women Long T-Shirt",
                          price: 30.0),
                      SingleProduct(
                          image: "women.jpg",
                          name: "Women Long T-Shirt",
                          price: 30.0),
                      SingleProduct(
                          image: "women.jpg",
                          name: "Women Long T-Shirt",
                          price: 30.0),
                      SingleProduct(
                          image: "women.jpg",
                          name: "Women Long T-Shirt",
                          price: 30.0)
                    ],
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
