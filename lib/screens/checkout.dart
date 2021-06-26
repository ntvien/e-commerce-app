import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/provider/product_provider.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/widgets/cart_single_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final TextStyle myStyle = TextStyle(fontSize: 18);
  late ProductProvider productProvider;

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
    productProvider = Provider.of<ProductProvider>(context);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                itemCount: productProvider.getCartListLength,
                itemBuilder: (context, index) {
                  return CartSingleProduct(
                    image: productProvider.getCartList[index].image,
                    name: productProvider.getCartList[index].name,
                    price: productProvider.getCartList[index].price,
                    quantity: productProvider.getCartList[index].quantity,
                  );
                },
              ),
              Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildBottomDetail(
                        startName: "Subtotal", endName: "\$ 60.00"),
                    _buildBottomDetail(startName: "Discount", endName: "3%"),
                    _buildBottomDetail(
                        startName: "Shipping", endName: "\$ 60.00"),
                    _buildBottomDetail(
                        startName: "Total", endName: "\$ 120.00"),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
