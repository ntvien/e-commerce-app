import 'package:e_commerce_app/screens/checkout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartSingleProduct extends StatefulWidget {
  final String? name;
  final String? image;
  int? quantity;
  final double? price;
  bool? isCount;
  CartSingleProduct(
      {this.name, this.image, this.quantity, this.price, this.isCount});
  @override
  _CartSingleProductState createState() => _CartSingleProductState();
}

class _CartSingleProductState extends State<CartSingleProduct> {
  final TextStyle myStyle = TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
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
                      image: NetworkImage("${widget.image}"),
                    ),
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
                          width: widget.isCount == false ? 120 : 100,
                          color: Color(0xfff2f2f2),
                          child: widget.isCount == false
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      child: Icon(Icons.remove),
                                      onTap: () {
                                        setState(
                                          () {
                                            if (widget.quantity! > 1) {
                                              widget.quantity =
                                                  (widget.quantity! - 1);
                                            }
                                          },
                                        );
                                      },
                                    ),
                                    Text(widget.quantity.toString(),
                                        style: myStyle),
                                    GestureDetector(
                                      child: Icon(Icons.add),
                                      onTap: () {
                                        setState(
                                          () {
                                            widget.quantity =
                                                (widget.quantity! + 1);
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Quantity"),
                                    Text(
                                      widget.quantity.toString(),
                                      style: TextStyle(fontSize: 18),
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
}
