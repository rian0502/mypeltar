

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabMenu{
  static const int dashboard = 0;
  static const int menu1 = 1;
  static const int menu2 = 2;
}



class AppState extends ChangeNotifier{
  final SharedPreferences _sharedPreferences;
  AppState(this._sharedPreferences);

  bool get isLogin => _sharedPreferences.getBool('isLogin') ?? false;
  set isLogin(bool value){
    _sharedPreferences.setBool('isLogin', value);
    notifyListeners();
  }

  Future<void> initializeApp() async {

  }
}