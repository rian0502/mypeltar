

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mypeltar/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState extends ChangeNotifier{
  late  SharedPreferences _sharedPreferences;
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
  void login(BuildContext context) async{

    toggleLoadLogin();
    AuthServices.loginAccess(_email.text, password.text).then((value) => {
      toggleLoadLogin(),
      if(value.status == 'success'){
        _sharedPreferences.setBool('isLogin', true),
        _sharedPreferences.setString('token', value.authorisation!.token!),
        _sharedPreferences.setString('name', value.user!.name!),
        _sharedPreferences.setString('email', value.user!.email!),
        _sharedPreferences.setString('guid', value.user!.guid!),
        _sharedPreferences.setInt('id', value.user!.id!),
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Berhasil Login'),
            backgroundColor: Colors.green,
          ),
        ),
        context.go('/home'),
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Gagal Login'),
            backgroundColor: Colors.green,
          ),
        )
      }
    });
  }


}