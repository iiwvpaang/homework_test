import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_config.dart';
import '../models/shopping_product.dart';
import '../services/api_service.dart';
import '../widgets/product_view.dart';
import '../widgets/title_bar.dart';

class LatestProduct extends StatefulWidget {
  const LatestProduct({super.key});

  @override
  State<LatestProduct> createState() => _LatestProductState();
}

class _LatestProductState extends State<LatestProduct> {
  final _scrollController = ScrollController(
    initialScrollOffset: 1,
    keepScrollOffset: true,
  );
  List<ShoppingProduct> latestProducts = <ShoppingProduct>[];
  bool loading = true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_loadMore);

    setState(() {
      _getLatestProducts();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _getLatestProducts() async {
    latestProducts = (await ApiService().getProducts())!;

    /*recommendedProducts
        .add(ShoppingProduct(id: 1, name: 'monitor', price: 12.5));
    recommendedProducts.add(ShoppingProduct(id: 2, name: 'mouse', price: 16.5));
    recommendedProducts
        .add(ShoppingProduct(id: 3, name: 'keyboard', price: 52.5));
    recommendedProducts
        .add(ShoppingProduct(id: 4, name: 'mobile phone', price: 1200.5));*/
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          height:
              (screenHeight * (1 - AppConfig.recommendedProductsHeightRatio)) -
                  AppConfig.bottomBarHeight -
                  70 -
                  (loading == true ? AppConfig.loadingBarHeight : 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleBar(titleName: 'Latest Products'),
              Expanded(
                child: latestProducts == null
                    ? Container(
                        child: Text('null'),
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        itemCount: latestProducts.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == latestProducts.length) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            return ProductView(product: latestProducts[index]);
                          }
                        },
                      ),
              ),
            ],
          ),
        ),
        (loading == true
            ? SizedBox(
                height: AppConfig.loadingBarHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 33,
                      height: 33,
                      child: CircularProgressIndicator(),
                    ),
                    Text(
                      '   Loading..',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox.shrink()),
      ],
    );
  }
}
