// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:e_commerce_app/model/category_icon.dart';
import 'package:e_commerce_app/model/product.dart';
import 'package:e_commerce_app/provider/category_provider.dart';
import 'package:e_commerce_app/provider/product_provider.dart';
import 'package:e_commerce_app/screens/checkout.dart';
import 'package:e_commerce_app/screens/detail_screen.dart';
import 'package:e_commerce_app/screens/list_product.dart';
import 'package:e_commerce_app/widgets/notification_button.dart';
import 'package:e_commerce_app/widgets/single_product.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

late CategoryProvider categoryProvider;
late ProductProvider productProvider;

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildCategoryProduct({String? image, int? color}) {
    return CircleAvatar(
      maxRadius: height! * 0.1 / 2.1,
      backgroundColor: Color(color!),
      child: Container(
        height: 40,
        child: Image(
          color: Colors.white,
          image: NetworkImage(image!),
        ),
      ),
    );
  }

  double? height, width;
  bool homeColor = true;

  bool checkoutColor = false;

  bool aboutColor = false;

  bool contactUsColor = false;
  bool profileColor = false;
  late MediaQueryData mediaQuery;

  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
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
                checkoutColor = false;
                aboutColor = false;
                profileColor = false;
                contactUsColor = false;
              });
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            selected: checkoutColor,
            onTap: () {
              setState(() {
                homeColor = false;
                checkoutColor = true;
                aboutColor = false;
                profileColor = false;
                contactUsColor = false;
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => CheckOut()));
            },
            leading: Icon(Icons.shopping_cart),
            title: Text("Checkout"),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              setState(() {
                homeColor = false;
                checkoutColor = false;
                aboutColor = true;
                profileColor = false;
                contactUsColor = false;
              });
            },
            leading: Icon(Icons.info),
            title: Text("About"),
          ),
          ListTile(
            selected: profileColor,
            onTap: () {
              setState(() {
                homeColor = false;
                checkoutColor = false;
                aboutColor = false;
                profileColor = true;
                contactUsColor = false;
              });
            },
            leading: Icon(Icons.info),
            title: Text("Profile"),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(() {
                homeColor = false;
                checkoutColor = false;
                aboutColor = false;
                profileColor = false;
                contactUsColor = true;
              });
            },
            leading: Icon(Icons.phone),
            title: Text("Contact Us"),
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

  Widget _buildImageSwipe({String? image}) {
    return Container(
      child: Image(
        image: NetworkImage(image!),
      ),
    );
  }

  Widget _buildImageSlider() {
    List<CategoryIcon> cameraIcon = categoryProvider.getCameraFirstIconList;
    List<CategoryIcon> shoesIcon = categoryProvider.getShoesFirstIconList;
    List<CategoryIcon> watchIcon = categoryProvider.getWatchFirstIconList;

    return Container(
      height: height! * 0.25,
      child: Carousel(
        autoplay: true,
        showIndicator: false,
        images: [
          // AssetImage("images/man.jpg"),
          // AssetImage("images/women.jpg"),
          // AssetImage("images/camera.jpg"),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cameraIcon.map((e) {
                return GestureDetector(
                  onTap: () {},
                  child: _buildImageSwipe(image: e.image),
                );
              }).toList(),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: shoesIcon.map((e) {
                return GestureDetector(
                  onTap: () {},
                  child: _buildImageSwipe(image: e.image),
                );
              }).toList(),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: watchIcon.map((e) {
                return GestureDetector(
                  onTap: () {},
                  child: _buildImageSwipe(image: e.image),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDressIcon() {
    List<CategoryIcon> dressIcon = categoryProvider.getDressIconList;
    List<Product> dress = categoryProvider.getDressList;
    return Row(
      children: dressIcon.map((e) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ListProduct(
                  name: "Dress",
                  snapShot: dress,
                ),
              ),
            );
          },
          child: _buildCategoryProduct(image: e.image, color: 0xff33dcfd),
        );
      }).toList(),
    );
  }

  Widget _buildShirtIcon() {
    List<CategoryIcon> shirtIcon = categoryProvider.getShirtIconList;
    List<Product> shirt = categoryProvider.getShirtList;
    return Row(
        children: shirtIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Shirt",
                snapShot: shirt,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(image: e.image, color: 0xfff38cdd),
      );
    }).toList());
  }

  Widget _buildShoeIcon() {
    List<CategoryIcon> shoesIcon = categoryProvider.getShoesIconList;
    List<Product> shoes = categoryProvider.getShoesList;
    return Row(
        children: shoesIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Shoes",
                snapShot: shoes,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(
          image: e.image,
          color: 0xff4ff2af,
        ),
      );
    }).toList());
  }

  Widget _buildPantIcon() {
    List<CategoryIcon> pantIcon = categoryProvider.getPantIconList;
    List<Product> pant = categoryProvider.getPantList;
    return Row(
        children: pantIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Pant",
                snapShot: pant,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(
          image: e.image,
          color: 0xff74acf7,
        ),
      );
    }).toList());
  }

  Widget _buildTieIcon() {
    List<CategoryIcon> tieIcon = categoryProvider.getTieIconList;
    List<Product> tie = categoryProvider.getTieList;
    return Row(
        children: tieIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Tie",
                snapShot: tie,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(
          image: e.image,
          color: 0xfffc6c8d,
        ),
      );
    }).toList());
  }

  Widget _buildCategory() {
    return Column(
      children: <Widget>[
        Container(
          height: height! * 0.1 - 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: 60,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _buildDressIcon(),
                _buildShirtIcon(),
                _buildShoeIcon(),
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
    List<Product> featureProduct = productProvider.getFeatureList;
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Featured",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      name: "Featured",
                      isCategory: false,
                      snapShot: featureProduct,
                    ),
                  ),
                );
              },
              child: Text(
                "View more",
                style: TextStyle(fontSize: 17, color: Colors.black87),
              ),
            )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getHomeFeatureList.map((e) {
              return Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => DetailScreen(
                            image: e.image,
                            price: e.price,
                            name: e.name,
                          ),
                        ),
                      );
                    },
                    child: SingleProduct(
                      image: e.image,
                      price: e.price,
                      name: e.name,
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
    List<Product> newAchivesProduct = productProvider.getNewAchivesList;
    return Column(
      children: <Widget>[
        Container(
          height: height! * 0.1 - 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "New Achives",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => ListProduct(
                            name: "NewAchives",
                            isCategory: false,
                            snapShot: newAchivesProduct,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "View more",
                      style: TextStyle(fontSize: 17, color: Colors.black87),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: productProvider.getHomeNewAchivesList.map((e) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              image: e.image,
                              price: e.price,
                              name: e.name,
                            ),
                          ),
                        );
                      },
                      child: SingleProduct(
                          image: e.image, price: e.price, name: e.name),
                    )
                  ],
                ),
              ],
            );
          }).toList()),
        ),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  void getCallAllFunction() {
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
    categoryProvider.getCameraFirstIconData();
    categoryProvider.getShoesFirstIconData();
    categoryProvider.getWatchFirstIconData();

    productProvider.getFeatureData();
    productProvider.getHomeFeatureData();
    productProvider.getNewAchivesData();
    productProvider.getHomeNewAchivesData();
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    productProvider = Provider.of<ProductProvider>(context);
    getCallAllFunction();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _key,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        title: Text(
          "HomePage",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.teal,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              _key.currentState!.openDrawer();
            }),
        actions: [
          NotificationButton(),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildImageSlider(),
                  _buildCategory(),
                  SizedBox(height: 10),
                  _buildFeature(),
                  _buildNewAchives()
                ],
              ),
            )
          ],
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => HomeScreen(),
            ),
          );
        },
        child: Icon(Icons.home),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
        child: Container(
          color: Colors.black38,
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              children: [
                Spacer(),
                IconButton(
                  icon: Icon(Icons.add_alert, color: Colors.white),
                  onPressed: () {},
                ),
                Spacer(),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.turned_in, color: Colors.white),
                  onPressed: () {},
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
