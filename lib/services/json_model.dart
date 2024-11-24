import 'dart:convert';
import '../models/shopping_product.dart';

class JsonToModel {
  List<ShoppingProduct> productModelFromJson(String jsonStr) {
    String nextCursor = json.decode(jsonStr)['nextCursor'];
    List? jsonDecoded = json.decode(jsonStr)['items'];
    List<ShoppingProduct> products = <ShoppingProduct>[];

    for (var item in jsonDecoded!) {
      ShoppingProduct oneProduct = addOne(item);
      products.add(oneProduct);
    }

    return products;
  }

  List<ShoppingProduct> recommendedProductModelFromJson(
      String jsonStr, int limit) {
    List? jsonDecoded = json.decode(jsonStr);
    List<ShoppingProduct> products = <ShoppingProduct>[];

    int loop = 1;
    for (var item in jsonDecoded!) {
      if (loop > limit && limit > 0) {
        break;
      }

      ShoppingProduct oneProduct = addOne(item);
      products.add(oneProduct);
      loop++;
    }

    return products;
  }

  ShoppingProduct addOne(dynamic item) {
    ShoppingProduct oneProduct = ShoppingProduct(
        id: item['id'],
        name: item['name'],
        price: double.parse(item['price'].toString()));

    return oneProduct;
  }
}
