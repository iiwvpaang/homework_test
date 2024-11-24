import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:homework_test/services/json_model.dart';
import 'package:http/http.dart' as http;

import '../api_constant.dart';
import '../app_config.dart';
import '../models/shopping_product.dart';

class ApiService {
  Future<List<ShoppingProduct>?> getProducts() async {
    try {
      var url = Uri.parse(
          '${ApiConstant.baseUrl}${ApiConstant.productsEndpoint}?limit=${AppConfig.productsDisplayAmount}');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print(response.body);
        List<ShoppingProduct> model =
            JsonToModel().productModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<ShoppingProduct>?> getRecommendedProducts() async {
    try {
      var url = Uri.parse(
          ApiConstant.baseUrl + ApiConstant.recommendedProductsEndpoint);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<ShoppingProduct> model = JsonToModel()
            .recommendedProductModelFromJson(
                response.body, AppConfig.recommendedProductsDisplayAmount);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
