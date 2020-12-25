import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/views/cart_screen.dart';

import './views/products_overview_screen.dart';
import './utils/app_routes.dart';
import './views/product_detail.screen.dart';
import './providers/products.dart';
import './providers/cart.dart';
import './providers/orders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Orders(),
        ),
      ],
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
          routes: {
            AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
            AppRoutes.CART: (ctx) => CartScreen(),
          }),
    );
  }
}
