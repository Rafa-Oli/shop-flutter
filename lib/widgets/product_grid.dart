import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../providers/products.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider =
        Provider.of<Products>(context); //lembrar do services(Angular)
    final products = productsProvider.items;

    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //notifica atualizacao do item, reconstruindo
        value: products[i],
        child: ProductItem(),
      ),
    );
  }
}
//SliverGridDelegateWithFixedCrossAxisCount significa que vai ter uma quantidade fixas de elementos no eixo CrossAxis(Linha)
