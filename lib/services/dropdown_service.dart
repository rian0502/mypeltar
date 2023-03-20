import 'package:dio/dio.dart';
import 'package:mypeltar/models/categories.dart';

import '../models/locations.dart';

class DropdownServices {
  static const String _url = 'http://10.0.2.2:8000/api/v1/';

  static Future<List<Categories>> getAll(String token) async {
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await dio.get('${_url}category/getall');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => Categories.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError {
      throw Exception('Failed to load data');
    }
  }

  static Future<List<Locations>> getAllLocation(String token) async {
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await dio.get('${_url}location/getall');
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => Locations.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load data');
      }
    } on DioError {
      throw Exception('Failed to load data');
    }
  }
}
