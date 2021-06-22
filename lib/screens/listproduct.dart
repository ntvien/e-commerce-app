import 'package:e_commerce_app/screens/homepage.dart';
import 'package:e_commerce_app/widgets/singleproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  final String? name;
  final snapShot;
  ListProduct({this.name, this.snapShot});

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
                  child: GridView.builder(
                    itemCount: snapShot.data.documents.length,
                    itemBuilder: (context, index) => SingleProduct(
                      name: snapShot.data.documents[index]["name"],
                      image: snapShot.data.documents[index]["image"],
                      price: snapShot.data.documents[index]["price"],
                    ),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
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
