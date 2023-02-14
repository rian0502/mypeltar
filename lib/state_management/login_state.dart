

import 'package:flutter/material.dart';

class LoginState extends ChangeNotifier{
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final bool _loadLogin = false;


  TextEditingController get email => _email;
  TextEditingController get password => _password;
  bool get loadLogin => _loadLogin;


}