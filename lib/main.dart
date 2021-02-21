import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/auth.dart';
import 'package:shop/views/auth_home_screen.dart';
import 'package:shop/views/auth_screen.dart';
import 'package:shop/views/cart_screen.dart';
import 'package:shop/views/product_form_screen.dart';
import 'package:shop/views/products_screen.dart';

import './views/products_overview_screen.dart';
import './utils/app_routes.dart';
import './views/product_detail.screen.dart';
import './views/orders_screen.dart';
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
          create: (_) => new Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => new Products(null, []),
          update: (ctx, auth,
                  previousProducts) => // ta pegando dados do provider Auth
              new Products(auth.token, previousProducts.items),
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
          // home: ProductOverviewScreen(),
          routes: {
            AppRoutes.AUTH_HOME: (ctx) => AuthOrHomeScreen(),
            AppRoutes.PRODUCT_DETAIL: (ctx) => ProductDetailScreen(),
            AppRoutes.CART: (ctx) => CartScreen(),
            AppRoutes.ORDERS: (ctx) => OrdersScreen(),
            AppRoutes.PRODUCTS: (ctx) => ProductsScreen(),
            AppRoutes.PRODUCT_FORM: (ctx) => ProductFormScreen(),
          }),
    );
  }
}
