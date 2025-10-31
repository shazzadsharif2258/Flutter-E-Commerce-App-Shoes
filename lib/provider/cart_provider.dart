import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> carts = [];

  void addCart(Map<String, dynamic> product) {
    carts.add(product);
    notifyListeners();
  }

  void removeCart(Map<String, dynamic> product) {
    carts.remove(product);
    notifyListeners();
  }
}
