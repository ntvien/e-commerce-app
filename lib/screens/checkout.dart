import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  final double? price;
  final String? name;
  final String? image;
  CheckOut({this.image, this.name, this.price});

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
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
                        fit: BoxFit.fill, image: AssetImage("images/${widget.image}")),
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
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Quantity"),
                              Text("1"),
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

  Widget _buildBottomDetail({String? startName, String? endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$startName",
          style: myStyle,
        ),
        Text(
          "$endName",
          style: myStyle,
        ),
      ],
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
            "Buy",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          onPressed: () {},
        ),
      ),
      appBar: AppBar(
        title: Text(
          "CheckOut Page",
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
                builder: (ctx) => CartScreen(),
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                _buildSingleCartProduct(),
                Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildBottomDetail(
                          startName: "Your Price", endName: "\$ 60.00"),
                      _buildBottomDetail(startName: "Discount", endName: "3%"),
                      _buildBottomDetail(
                          startName: "Shipping", endName: "\$ 60.00"),
                      _buildBottomDetail(startName: "Total", endName: "\$ 120.00"),
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
