
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/provider/category_provider.dart';
import 'package:e_commerce_app/screens/detail_screen.dart';
import 'package:e_commerce_app/widgets/single_product.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:provider/provider.dart';

class SearchCategory extends SearchDelegate<void> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    List<Product> searchCategory = categoryProvider.searchCategoryList(query);

    return GridView.count(
        childAspectRatio: 0.76,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: searchCategory
            .map((e) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => DetailScreen(
                  image: e.image,
                  name: e.name,
                  price: e.price,
                ),
              ),
            );
          },
          child: SingleProduct(
            image: e.image,
            name: e.name,
            price: e.price,
          ),
        ))
            .toList());
  }

  void getProduct() {}
  @override
  Widget buildSuggestions(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    List<Product> searchCategory = categoryProvider.searchCategoryList(query);
    return GridView.count(
        childAspectRatio: 0.87,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: searchCategory
            .map((e) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => DetailScreen(
                  image: e.image,
                  name: e.name,
                  price: e.price,
                ),
              ),
            );
          },
          child: SingleProduct(
            image: e.image,
            name: e.name,
            price: e.price,
          ),
        ))
            .toList());
  }
}
