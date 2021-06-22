import 'package:e_commerce_app/screens/detailscreen.dart';
import 'package:e_commerce_app/screens/listproduct.dart';
import 'package:e_commerce_app/widgets/singleproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Product? menData;
Product? womenData;
Product? bulbData;
Product? smartPhoneData;
var featureSnapShot;
var newAchivesSnapShot;

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  bool homeColor = true;
  bool cartColor = false;
  bool aboutColor = false;
  bool contactUsColor = false;

  Widget _buildCategoryProduct({String? image, int? color}) {
    return CircleAvatar(
      maxRadius: 38,
      backgroundColor: Color(color!),
      child: Container(
        height: 40,
        child: Image(
          color: Colors.white,
          image: AssetImage("images/$image"),
        ),
      ),
    );
  }

  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName:
                Text("Vien Nguyen", style: TextStyle(color: Colors.black)),
            accountEmail: Text("thevien898@gmail.com",
                style: TextStyle(color: Colors.black)),
            decoration: BoxDecoration(color: Color(0xfff2f2f2)),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("images/userImage.png"),
            ),
          ),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                cartColor = false;
                aboutColor = false;
                contactUsColor = false;
              });
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            selected: cartColor,
            onTap: () {
              homeColor = false;
              cartColor = true;
              aboutColor = false;
              contactUsColor = false;
            },
            leading: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              homeColor = false;
              cartColor = false;
              aboutColor = true;
              contactUsColor = false;
            },
            leading: Icon(Icons.info),
            title: Text("About"),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              homeColor = false;
              cartColor = false;
              aboutColor = false;
              contactUsColor = true;
            },
            leading: Icon(Icons.phone),
            title: Text("Contact us"),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    return Container(
      height: 190,
      child: Carousel(
        autoplay: true,
        showIndicator: false,
        images: [
          AssetImage("images/women.jpg"),
          AssetImage("images/man.jpg"),
          AssetImage("images/camera.jpg"),
        ],
      ),
    );
  }

  Widget _buildCategory() {
    return Column(
      children: [
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Category",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                "View more",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Container(
          height: 60,
          child: Row(
            children: [
              _buildCategoryProduct(image: "women.jpg", color: 0xff33dcfd),
              _buildCategoryProduct(image: "userImage.png", color: 0xfff38cdd),
              _buildCategoryProduct(image: "userImage.png", color: 0xff4ff2af),
              _buildCategoryProduct(image: "userImage.png", color: 0xff74acf7),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeature() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Featured",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      name: "Featured",
                      snapShot: featureSnapShot,
                    ),
                  ),
                );
              },
              child: Text(
                "View more",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => DetailScreen(
                      image: menData!.image,
                      name: menData!.name,
                      price: menData!.price,
                    ),
                  ),
                );
              },
              child: SingleProduct(
                image: menData!.image,
                name: menData!.name,
                price: menData!.price,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => DetailScreen(
                      image: womenData!.image,
                      name: womenData!.name,
                      price: womenData!.price,
                    ),
                  ),
                );
              },
              child: SingleProduct(
                image: womenData!.image,
                name: womenData!.name,
                price: womenData!.price,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildNewAchives() {
    return Column(
      children: [
        Container(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Achives",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => ListProduct(
                            name: "New Achives",
                            snapShot: newAchivesSnapShot,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "View more",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              image: bulbData!.image,
                              name: bulbData!.name,
                              price: bulbData!.price,
                            ),
                          ),
                        );
                      },
                      child: SingleProduct(
                        image: bulbData!.image,
                        name: bulbData!.name,
                        price: bulbData!.price,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              image: smartPhoneData!.image,
                              name: smartPhoneData!.name,
                              price: smartPhoneData!.price,
                            ),
                          ),
                        );
                      },
                      child: SingleProduct(
                        image: smartPhoneData!.image,
                        name: smartPhoneData!.name,
                        price: smartPhoneData!.price,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _keyScaffold.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu, color: Colors.black),
        ),
        title: Text(
          "HomePage",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none, color: Colors.black),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Firestore.instance
            .collection("product")
            .document("KzDvCVWJ8CQCPlbW21Yq")
            .collection("featureproduct")
            .getDocuments(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // List<DocumentSnapshot>? docs = snapshot.data!.documents;
          featureSnapShot = snapshot;
          menData = Product(
              image: snapshot.data!.documents[0]['image'],
              name: snapshot.data!.documents[0]['name'],
              price: snapshot.data!.documents[0]['price']);

          womenData = Product(
              image: snapshot.data!.documents[1]['image'],
              name: snapshot.data!.documents[1]['name'],
              price: snapshot.data!.documents[1]['price']);

          return FutureBuilder(
            future: Firestore.instance
                .collection("product")
                .document("KzDvCVWJ8CQCPlbW21Yq")
                .collection("newachives")
                .getDocuments(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              newAchivesSnapShot = snapshot;
              bulbData = Product(
                  image: snapshot.data!.documents[1]['image'],
                  name: snapshot.data!.documents[1]['name'],
                  price: snapshot.data!.documents[1]['price']);

              smartPhoneData = Product(
                  image: snapshot.data!.documents[2]['image'],
                  name: snapshot.data!.documents[2]['name'],
                  price: snapshot.data!.documents[2]['price']);

              return Container(
                height: double.infinity,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildImageSlider(),
                              _buildCategory(),
                              SizedBox(height: 20),
                              _buildFeature(),
                              _buildNewAchives(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
