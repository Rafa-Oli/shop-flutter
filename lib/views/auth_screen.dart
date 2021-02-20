import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop/widgets/auth_card.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(600, 500, 400, 0.5), //215, 117, 255, 0.5
                Color.fromRGBO(700, 200, 200, 0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20.0),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 70),
                transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
                // '..' cascade operator
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black26,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  'My Store',
                  style: TextStyle(
                    color: Theme.of(context).accentTextTheme.headline6.color,
                    fontSize: 45,
                    fontFamily: "Anton",
                  ),
                ),
              ),
              AuthCard(),
            ],
          ),
        ),
      ],
    ));
  }
}
