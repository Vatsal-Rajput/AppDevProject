import 'package:flutter/material.dart';
import 'main.dart';

class cartItems with ChangeNotifier {
  List<bool> selected = List.filled(10, false);
  List<Product> _products = [];
  List<Product> get products => _products;
  int sum = 0;
  void tick(int i) {
    selected[i] = !selected[i];
    notifyListeners();
  }

  void buying(Product product) {
    if (selected[product.id] == true) {
      sum -= product.price;
      products.remove(product);
    } else {
      products.add(product);
      sum += product.price;
    }
    notifyListeners();
  }

  void empty() {
    _products = [];
    sum = 0;
    selected = List.filled(10, false);
    notifyListeners();
  }
}
