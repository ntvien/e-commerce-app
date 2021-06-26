import 'package:flutter/material.dart';

class CartSingleProduct extends StatefulWidget {
  final String? name;
  final String? image;
  final int? quantity;
  final double? price;
  CartSingleProduct({this.name, this.image, this.quantity, this.price});
  @override
  _CartSingleProductState createState() => _CartSingleProductState();
}

class _CartSingleProductState extends State<CartSingleProduct> {
  int count = 0;
  final TextStyle myStyle = TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    count = widget.quantity as int;
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
}
