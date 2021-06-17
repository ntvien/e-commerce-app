import 'package:e_commerce_app/screens/detailscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'checkout.dart';

class CartScreen extends StatefulWidget {
  final double? price;
  final String? name;
  final String? image;
  CartScreen({this.image, this.name, this.price});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 1;
  final TextStyle myStyle = TextStyle(fontSize: 18);

  Widget _buildSingleCartProduct() {
    return Container(
      height: 140,
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("images/${widget.image}")),
                  ),
                ),
                Container(
                  height: 130,
                  width: 200,
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.name}",
                          style: myStyle,
                        ),
                        Text(
                          "Cloths",
                          style: myStyle,
                        ),
                        Text(
                          "\$ ${widget.price.toString()}",
                          style: TextStyle(
                              color: Color(0xff9b96d6),
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 35,
                          width: 120,
                          color: Color(0xfff2f2f2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                child: Icon(Icons.remove),
                                onTap: () {
                                  setState(() {
                                    if (count > 1) {
                                      count--;
                                    }
                                  });
                                },
                              ),
                              Text(count.toString(), style: myStyle),
                              GestureDetector(
                                child: Icon(Icons.add),
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 10),
        child: RaisedButton(
          color: Color(0xff746bc9),
          child: Text(
            "Continous",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => CheckOut(
                  image: widget.image,
                  name: widget.name,
                  price: widget.price,
                ),
              ),
            );
          },
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Cart Page",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => DetailScreen(),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
          _buildSingleCartProduct(),
        ],
      ),
    );
  }
}
