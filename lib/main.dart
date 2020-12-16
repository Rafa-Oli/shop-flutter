import 'package:flutter/material.dart';
import './views/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Loja',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.red,
          fontFamily: 'Lato',
          primaryTextTheme: TextTheme(
            headline6: TextStyle(color: Colors.white),
          )),
      home: ProductOverviewScreen(),
    );
  }
}
