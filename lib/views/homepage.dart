// ignore: file_names
// ignore_for_file: prefer_const_constructors, duplicate_ignore, file_names

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shop/controllers/productcontroller.dart';

import 'package:shop/views/product_tile.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'ShopX',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w900),
                ),
              ),
              IconButton(icon: Icon(Icons.view_list_rounded), onPressed: () {}),
              IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            if (productController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            } else {
              return StaggeredGridView.countBuilder(
                  itemCount: productController.productList.length,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1));
            }
          }),
        )
      ]),
    );
  }
}
