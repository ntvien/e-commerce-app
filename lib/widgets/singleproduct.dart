import 'package:flutter/material.dart';
class SingleProduct extends StatelessWidget {
  final String image;
  final double price;
  final String name;
  SingleProduct({required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 250,
        width: 170,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 170,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(image),
                    )),
              ),
            ),
            Text(
              "\$ ${price.toString()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Color(0xff9b96d6)),
            ),
            Container(
              child: Text(
                "$name",
                style: TextStyle(fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}
