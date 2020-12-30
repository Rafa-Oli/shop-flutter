import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    const url =
        'https://flutter-rafa-default-rtdb.firebaseio.com/products.json';
    http
        .post(
      url,
      body: json.encode({
        'title': newProduct.title,
        'description': newProduct.description,
        'price': newProduct.price,
        'imageUrl': newProduct.imageUrl,
        'isFavorite': newProduct.isFavorite,
      }),
    )
        .then((value) {
      _items.add(Product(
        id: json.decode(value.body)['name'],
        title: newProduct.title,
        description: newProduct.description,
        price: newProduct.price,
        imageUrl: newProduct.imageUrl,
      ));
      notifyListeners(); // notifica todos os interessados da mudança
    });
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

  void deleteProduct(String id) {
    final index = _items.indexWhere((element) => element.id == id);
    if (index >= 0) {
      _items.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }
}
