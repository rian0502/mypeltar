

import 'package:dio/dio.dart';

import '../models/maintenance.dart';

class MaintenanceService{
  static String URL = 'http://peltar.hasibuanapp.site/api/v1/maintenance';


  static Future<Maintenance> getAll(String token, int page) async{
    var dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';
    var response = await dio.get('$URL/getall?page=$page');
    if (response.statusCode == 200) {
      return Maintenance.fromJson(response.data);
    }else{
      return Maintenance();
    }
  }







}