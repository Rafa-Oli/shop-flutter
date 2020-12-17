import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './views/products_overview_screen.dart';
import './utils/app_routes.dart';
import './views/product_detail.screen.dart';
import './providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new Products(),
      child: MaterialApp(
          title: 'Minha Loja',
          theme: ThemeData(
            primarySwatch: Colors.cyan,
            accentColor: Colors.red,
            fontFamily: 'Lato',
            primaryTextTheme: TextTheme(
              headline6: TextStyle(color: Colors.white),
            ),
          ),
          home: ProductOverviewScreen(),
          routes: {AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen()}),
    );
  }
}
