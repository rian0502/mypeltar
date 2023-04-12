import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/auth_services.dart';

class TabMenu {
  static const int dashboard = 0;
  static const int activity = 1;
  static const int setting = 2;
  static const int profile = 3;
}

class AppState extends ChangeNotifier {
  AppState(this._sharedPreferences);
  bool _isLogin = false;
  late final SharedPreferences _sharedPreferences;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _loadLogin = false;
  bool _passwordVisible = true;

  TextEditingController get email => _email;
  TextEditingController get password => _password;

  bool get loadLogin => _loadLogin;
  bool get passwordVisible => _passwordVisible;
  bool get isLogin => _isLogin;
  void togglePasswordVisibility() {
    _passwordVisible = !_passwordVisible;
    notifyListeners();
  }

  void toggleLoadLogin() {
    _loadLogin = !_loadLogin;
    notifyListeners();
  }

  void login(BuildContext context) async {
    if (_email.text.isEmpty || _password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email dan Password tidak boleh kosong'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      toggleLoadLogin();
      AuthServices.loginAccess(_email.text, password.text).then((value) => {
            if (value.status == 'success')
              {
                _isLogin = true,
                _sharedPreferences.setBool('isLogin', true),
                _sharedPreferences.setBool('isLogin', true),
                _sharedPreferences.setString(
                    'token', value.authorisation!.token!),
                _sharedPreferences.setString('nama', value.user!.nama!),
                _sharedPreferences.setString('email', value.user!.email!),
                _sharedPreferences.setString('username', value.user!.username!),
                _sharedPreferences.setString('role', value.user!.subsatker!.subsatker!),
                _sharedPreferences.setString(
                    'satker', value.user!.satker!.satker!),

                toggleLoadLogin(),
                notifyListeners(),
                context.go('/dashboard'),
              }
            else
              {
                toggleLoadLogin(),
                notifyListeners(),
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Username dan Password Salah'),
                    backgroundColor: Colors.deepPurple,
                  ),
                )
              }
          });
    }
  }

  Future<void> logout(BuildContext context) async {
    _isLogin = false;
    _sharedPreferences.setBool('isLogin', false);
    _sharedPreferences.remove('token');
    _sharedPreferences.remove('nama');
    _sharedPreferences.remove('email');
    _sharedPreferences.remove('username');
    _sharedPreferences.remove('role');
    _sharedPreferences.remove('satker');
    _sharedPreferences.remove('subsatker');
    notifyListeners();
    GoRouter.of(context).go('/login');
  }

  Future<void> initializeApp() async {
    print('status login: ${_sharedPreferences.getBool('isLogin')}');
    _isLogin = _sharedPreferences.getBool('isLogin') ?? false;
  }
}
