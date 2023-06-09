import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../models/assets.dart';
import '../models/detail_asset.dart';

class AssetsServices {
  static String url = 'http://peltar.hasibuanapp.site/api/v1/asset/';

   static Future<Assets> getAll(String token, String page) async {
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await dio.get('${url}getall?page=$page');
      if (response.statusCode == 200) {
        return Assets.fromJson(response.data);
      }else{
        return Assets();
      }
    } on DioError {
      return Assets();
    }
  }

  static Future<DetailAsset> show(String id, String token) async {
    var dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';
    var response = await dio.get('${url}show/$id');
    if (response.statusCode == 200) {
      return DetailAsset.fromJson(response.data);
    } else {
      return DetailAsset();
    }
  }
}
