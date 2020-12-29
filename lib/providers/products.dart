import 'dart:math';

import 'package:flutter/material.dart';
import 'product.dart';
import '../data/dummy_data.dart';

class Products with ChangeNotifier {
  //observable, vai notificar mudanças

  List<Product> _items = DUMMY_PRODUCTS;

// vai retornar a copia dos dados, para que não tenha perca o controle dos dados
  List<Product> get items => [..._items];

  List<Product> get favoriteItems {
    return _items.where((prod) => prod.isFavorite).toList();
  }

  int get itemsCount {
    return _items.length;
  }

  void addProduct(Product newProduct) {
    _items.add(Product(
      id: Random().nextDouble().toString(),
      title: newProduct.title,
      description: newProduct.description,
      price: newProduct.price,
      imageUrl: newProduct.imageUrl,
    ));
    notifyListeners(); // notifica todos os interessados da mudança
  }

  void updateProduct(Product product) {
    if (product == null || product.id == null) {
      return;
    }
    //retorna o index
    final index = _items.indexWhere((element) => element.id == product.id);

    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
  }
}
