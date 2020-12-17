import 'package:flutter/material.dart';
import '../models/product.dart';
import '../data/dummy_data.dart';

class Products with ChangeNotifier {
  //observable, vai notificar mudanças

  List<Product> _items = DUMMY_PRODUCTS;

  List<Product> get items => [
        ..._items
      ]; // vai retornar a copia dos dados, para que não tenha perca o controle dos dados

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); // notifica todos os interessados da mudança
  }
}
