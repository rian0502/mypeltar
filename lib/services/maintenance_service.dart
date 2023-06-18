

import 'package:dio/dio.dart';

import '../models/maintenance.dart';

class MaintenanceService{
  static String url = 'http://peltar.hasibuanapp.site/api/v1/maintenance';

  static Future<List<Maintenance>> getAll(String token) async{

      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await dio.get('$url/getall');
      if (response.statusCode == 200) {

        List<Maintenance> data = [];
        for (var item in response.data) {

          data.add(Maintenance.fromJson(item));
        }
        return data;
      }else{
        return [];
      }

  }







}