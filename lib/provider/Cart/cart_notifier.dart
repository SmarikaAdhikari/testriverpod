import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/api.dart';
// import 'package:testriverpod/model/product.dart';

final cartNotifierProvider =
    ChangeNotifierProvider<CartNotifier>((ref) => CartNotifier());

class CartNotifier extends ChangeNotifier {
  final List<Products> _cart = [];

  List<Products> get cart => _cart;

  void addProduct(Products product) {
    _cart.add(product);
    notifyListeners();
  }

  void removeProduct(Products product) {
    _cart.remove(product);
    notifyListeners();
  }

  void removeProductByIndex() {
    _cart.remove(_cart.last);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
