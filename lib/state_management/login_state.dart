

import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier{
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
   bool _loadLogin = false;
   bool _passwordVisible = false;

  TextEditingController get email => _email;
  TextEditingController get password => _password;
  bool get loadLogin => _loadLogin;
  bool get passwordVisible => _passwordVisible;

  void togglePasswordVisibility() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }
  void toggleLoadLogin() {
    _loadLogin = !_loadLogin;
    notifyListeners();
  }


}