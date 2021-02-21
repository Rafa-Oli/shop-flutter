import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  Future<void> _authenticate(
      String email, String password, String urlSegement) async {
    final url =
        "https://identitytoolkit.googleapis.com/v1/accounts:$urlSegement?key=AIzaSyBUX3jpyuIVGQ_ObHhUEKzRd4jdqI3I_q4 ";
    final response = await http.post(
      url,
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true,
      }),
    );

    final responseBody = json.decode(response.body);
    if (responseBody['error'] != null) {
      throw AuthException(responseBody['error']['message']);
    }

    return Future.value();
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, "signUP");
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "signInWithPassword");
  }
}
