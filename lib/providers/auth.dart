import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url =
      "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBUX3jpyuIVGQ_ObHhUEKzRd4jdqI3I_q4 ";

  Future<void> signup(String email, String password) async {
    final response = await http.post(
      _url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    print(json.decode(response.body));

    return Future.value();
  }
}
