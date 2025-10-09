import 'package:flutter/material.dart';
import '../models/computer.dart';

class CartItem {
  final Computer computer;
  int quantity;

  CartItem({required this.computer, this.quantity = 1});
}

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount => _items.fold(
      0, (sum, item) => sum + (item.computer.price * item.quantity));

  void addItem(Computer computer) {
    final existingIndex =
        _items.indexWhere((item) => item.computer.id == computer.id);

    if (existingIndex >= 0) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(computer: computer));
    }
    notifyListeners();
  }

  void removeItem(String computerId) {
    _items.removeWhere((item) => item.computer.id == computerId);
    notifyListeners();
  }

  void updateQuantity(String computerId, int quantity) {
    final index = _items.indexWhere((item) => item.computer.id == computerId);
    if (index >= 0) {
      if (quantity <= 0) {
        _items.removeAt(index);
      } else {
        _items[index].quantity = quantity;
      }
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
