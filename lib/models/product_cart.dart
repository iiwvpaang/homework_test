import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:homework_test/models/product.dart';

class ProductCart extends ChangeNotifier {
  final String _boxName = 'cartBox';
  List<Product> _products = [];
  int _amount = 0;

  Future<Box<Product>> get _box async => await Hive.openBox<Product>(_boxName);

  // get products in cart
  void getProducts() async {
    var box = await _box;

    _products = box.values.toList();
    notifyListeners();
  }

  // return a specific product from cart
  Product getProduct(int index) {
    return _products[index];
  }

  List<Product> get getCartProducts {
    return _products;
  }

  // return amount of items in cart
  int get getAmount {
    return _amount;
  }

  // Product count
  // return a length of product array
  int get productCount {
    return _products.length;
  }

  // Add product to cart, then update cart
  void addProduct(Product productObj) async {
    var box = await _box;
    await box.add(productObj);

    _products = box.values.toList();
    _amount += productObj.amount;
    notifyListeners();
  }

  // delete
  void deleteProduct(int index) async {
    var box = await _box;
    await box.deleteAt(index);

    _products = box.values.toList();
    updateAmount();
    notifyListeners();
  }

  // edit product with amount (for example)
  void updateProduct(int index, Product productObj) async {
    var box = await _box;
    await box.putAt(index, productObj);

    _products = box.values.toList();
    updateAmount();
    notifyListeners();
  }

  void updateAmount() {
    _amount = 0;

    for (var product in _products) {
      _amount += product.amount;
    }
  }
}
