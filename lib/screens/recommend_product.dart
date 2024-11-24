import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework_test/app_config.dart';

import '../models/shopping_product.dart';
import '../services/api_service.dart';
import '../widgets/product_view.dart';
import '../widgets/title_bar.dart';

class RecommendProduct extends StatefulWidget {
  const RecommendProduct({super.key});

  @override
  State<RecommendProduct> createState() => _RecommendProductState();
}

class _RecommendProductState extends State<RecommendProduct> {
  List<ShoppingProduct> recommendedProducts = <ShoppingProduct>[];

  @override
  void initState() {
    super.initState();

    setState(() {
      _getRecommendedProducts();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _getRecommendedProducts() async {
    recommendedProducts = (await ApiService().getRecommendedProducts())!;

    /*recommendedProducts
        .add(ShoppingProduct(id: 1, name: 'monitor', price: 12.5));
    recommendedProducts.add(ShoppingProduct(id: 2, name: 'mouse', price: 16.5));
    recommendedProducts
        .add(ShoppingProduct(id: 3, name: 'keyboard', price: 52.5));
    recommendedProducts
        .add(ShoppingProduct(id: 4, name: 'mobile phone', price: 1200.5));*/
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * AppConfig.recommendedProductsHeightRatio,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleBar(titleName: 'Recommend Product'),
          Expanded(
            child: recommendedProducts == null
                ? Container(
                    child: Text('null'),
                  )
                : ListView.builder(
                    itemCount: recommendedProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == recommendedProducts.length) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return ProductView(product: recommendedProducts[index]);
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
