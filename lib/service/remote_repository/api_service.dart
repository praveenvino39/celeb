import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  late Dio dio;

  ApiService() {
    var options = BaseOptions(
        baseUrl: 'http://10.0.2.2:8000/api/',
        connectTimeout: 10000,
        receiveTimeout: 10000,
        contentType: "application/json");
    dio = Dio(options);
    dio.interceptors.add(PrettyDioLogger());
// customization
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  Future loginUser(Map loginParams) async {
    return await dio.post("login/", data: jsonEncode(loginParams));
  }
}
