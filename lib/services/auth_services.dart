import 'package:dio/dio.dart';
import '../models/login.dart';

class AuthServices {
  static String url = 'http://10.0.2.2:8000/api/';

  static Future<Login> loginAccess(String username, String password) async {
    try{
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      var response = await dio.post('${url}login',
          data: {
        'username': username,
        'password': password
      });

      return Login.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return Login();
    }
  }
}
