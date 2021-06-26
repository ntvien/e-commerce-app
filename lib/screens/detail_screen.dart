import 'package:e_commerce_app/model/cart.dart';
import 'package:e_commerce_app/provider/product_provider.dart';
import 'package:e_commerce_app/screens/cart_screen.dart';
import 'package:e_commerce_app/screens/checkout.dart';
import 'package:e_commerce_app/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String? image;
  final String? name;
  final double? price;
  final ProductProvider? productProvider;
  DetailScreen({this.image, this.name, this.price, this.productProvider});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int count = 1;
  final TextStyle myStyle = TextStyle(fontSize: 18);

  Widget _buildSizeProduct({String? size}) {
    return Container(
      height: 60,
      width: 60,
      color: Color(0xfff2f2f2),
      child: Center(
        child: Text(
          "$size",
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  Widget _buildColorProduct({Color? color}) {
    return Container(
      height: 60,
      width: 60,
      color: color,
    );
  }

  Widget _buildImage() {
    return Center(
      child: Row(
        children: [
          Container(
            width: 220,
            child: Card(
              child: Container(
                padding: EdgeInsets.all(13),
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("${widget.image}"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNameToDescriptionPart() {
    return Container(
      height: 100,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.name}",
                style: myStyle,
              ),
              Text(
                "\$ ${widget.price.toString()}",
                style: TextStyle(fontSize: 18, color: Color(0xff9b96d6)),
              ),
              Text(
                "Description",
                style: myStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      height: 100,
      child: Wrap(
        children: [
          Text(
            "Về cách chơi, với ưu thế chỉ cần 1 điểm trước UAE là đủ để tuyển Việt Nam "
            "giữ ngôi đầu bảng và đi thẳng vào vòng loại kế tiếp của World Cup 2022 "
            "nhiều người sẽ nghĩ HLV Park Hang Seo sẽ cho đội nhà chơi phòng ngự.",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _buildSizePart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Size", style: myStyle),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 270,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSizeProduct(size: "S"),
              _buildSizeProduct(size: "M"),
              _buildSizeProduct(size: "L"),
              _buildSizeProduct(size: "XXL"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 15,
        ),
        Text("Color", style: myStyle),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 270,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildColorProduct(color: Colors.blue[300]),
              _buildColorProduct(color: Colors.green[300]),
              _buildColorProduct(color: Colors.yellow[300]),
              _buildColorProduct(color: Colors.cyan[300]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityPart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Text("Quantity", style: myStyle),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          width: 130,
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(20),
          ),
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
    );
  }

  Widget _buildButtonCheckOutPart() {
    return Container(
      height: 50,
      child: MyButton(
        name: "CheckOut",
        onPressed: () {
          widget.productProvider!.getCartData(
            name: widget.name,
            image: widget.image,
            price: widget.price,
            quantity: count,
          );
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => CartScreen(),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Page",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
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
        child: ListView(
          children: [
            _buildImage(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNameToDescriptionPart(),
                  _buildDescription(),
                  _buildSizePart(),
                  _buildColorPart(),
                  _buildQuantityPart(),
                  SizedBox(height: 15),
                  _buildButtonCheckOutPart(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}