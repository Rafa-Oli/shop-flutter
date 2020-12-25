import 'dart:math';

import 'package:flutter/foundation.dart';

import 'cart.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  Order({
    this.id,
    this.total,
    this.products,
    this.date,
  });
}

//controla todos os pedidos dentro d aplicação
class Orders with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        date: DateTime.now(),
        products: cart.items.values.toList(),
      ),
    );
    notifyListeners();
  }
}
