import 'dart:math';

import 'package:flutter/foundation.dart';
import './product.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  CartItem({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get item {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      // verifica se ja existe o produto dentro do carrinho
      _items.update(
        product.id,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      //vai incluir se não tiver presente
      _items.putIfAbsent(
          product.id,
          () => CartItem(
                id: Random().nextDouble().toString(),
                title: product.title,
                price: product.price,
                quantity: 1,
              ));
    }
    notifyListeners();
  }
}
