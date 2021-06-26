import 'package:e_commerce_app/model/category_icon.dart';
import 'package:e_commerce_app/provider/category_provider.dart';
import 'package:e_commerce_app/provider/product_provider.dart';
import 'package:e_commerce_app/screens/detail_screen.dart';
import 'package:e_commerce_app/screens/list_product.dart';
import 'package:e_commerce_app/widgets/single_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../model/product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  bool homeColor = true;
  bool cartColor = false;
  bool aboutColor = false;
  bool contactUsColor = false;

  late CategoryProvider categoryProvider;
  late ProductProvider productProvider;

  Widget _buildCategoryProduct({String? image, int? color}) {
    return CircleAvatar(
      maxRadius: 38,
      backgroundColor: Color(color!),
      child: Container(
        height: 40,
        child: Image(
          color: Colors.white,
          image: NetworkImage("$image"),
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

  Widget _buildDressIcon() {
    List<Product> dressList = categoryProvider.getDressList;
    List<CategoryIcon> dressIconList = categoryProvider.getDressIconList;

    return Row(
      children: dressIconList.map((dressIcon) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      name: "Dress",
                      snapShot: dressList,
                    ),
                  ),
                );
              },
              child: _buildCategoryProduct(
                image: dressIcon.image,
                color: 0xff33dcfd,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildShirtIcon() {
    List<Product> shirtList = categoryProvider.getShirtList;
    List<CategoryIcon> shirtIconList = categoryProvider.getShirtIconList;

    return Row(
      children: shirtIconList.map((shirtIcon) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      name: "Dress",
                      snapShot: shirtList,
                    ),
                  ),
                );
              },
              child: _buildCategoryProduct(
                image: shirtIcon.image,
                color: 0xfff38cdd,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildShoesIcon() {
    List<Product> shoesList = categoryProvider.getShoesList;
    List<CategoryIcon> shoesIconList = categoryProvider.getShoesIconList;

    return Row(
      children: shoesIconList.map((shoesIcon) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      name: "Dress",
                      snapShot: shoesList,
                    ),
                  ),
                );
              },
              child: _buildCategoryProduct(
                image: shoesIcon.image,
                color: 0xff4ff2af,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildPantIcon() {
    List<Product> pantList = categoryProvider.getPantList;
    List<CategoryIcon> pantIconList = categoryProvider.getPantIconList;

    return Row(
      children: pantIconList.map((pantIcon) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      name: "Dress",
                      snapShot: pantList,
                    ),
                  ),
                );
              },
              child: _buildCategoryProduct(
                image: pantIcon.image,
                color: 0xff74acf7,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildTieIcon() {
    List<Product> tieList = categoryProvider.getTieList;
    List<CategoryIcon> tieIconList = categoryProvider.getTieIconList;

    return Row(
      children: tieIconList.map((tieIcon) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      name: "Dress",
                      snapShot: tieList,
                    ),
                  ),
                );
              },
              child: _buildCategoryProduct(
                image: tieIcon.image,
                color: 0xff74acf7,
              ),
            ),
          ],
        );
      }).toList(),
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
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildDressIcon(),
                _buildShirtIcon(),
                _buildShoesIcon(),
                _buildPantIcon(),
                _buildTieIcon(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeature() {
    List<Product> featureList = productProvider.getFeatureList;
    List<Product> homeFeatureList = productProvider.getHomeFeatureList;

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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      name: "Featured",
                      snapShot: featureList,
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: homeFeatureList.map((homeFeatureData) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => DetailScreen(
                            image: homeFeatureData.image,
                            name: homeFeatureData.name,
                            price: homeFeatureData.price,
                            productProvider: productProvider,
                          ),
                        ),
                      );
                    },
                    child: SingleProduct(
                      image: homeFeatureData.image,
                      name: homeFeatureData.name,
                      price: homeFeatureData.price,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildNewAchives() {
    List<Product> newAchivesList = productProvider.getNewAchivesList;
    List<Product> homeNewAchivesList = productProvider.getHomeNewAchivesList;

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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => ListProduct(
                            name: "New Achives",
                            snapShot: newAchivesList,
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: homeNewAchivesList.map((homeNewAchivesData) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => DetailScreen(
                            image: homeNewAchivesData.image,
                            name: homeNewAchivesData.name,
                            price: homeNewAchivesData.price,
                            productProvider: productProvider,
                          ),
                        ),
                      );
                    },
                    child: SingleProduct(
                      image: homeNewAchivesData.image,
                      name: homeNewAchivesData.name,
                      price: homeNewAchivesData.price,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    CategoryProvider categoryProvider = Provider.of(context, listen: false);
    categoryProvider.getDressData();
    categoryProvider.getShirtData();
    categoryProvider.getShoesData();
    categoryProvider.getPantData();
    categoryProvider.getTieData();
    categoryProvider.getDressIconData();
    categoryProvider.getShirtIconData();
    categoryProvider.getShoesIconData();
    categoryProvider.getPantIconData();
    categoryProvider.getTieIconData();

    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.getFeatureData();
    productProvider.getNewAchivesData();
    productProvider.getHomeFeatureData();
    productProvider.getHomeNewAchivesData();
    productProvider.getCartData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of(context);
    productProvider = Provider.of(context);

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
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(children: [
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
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
