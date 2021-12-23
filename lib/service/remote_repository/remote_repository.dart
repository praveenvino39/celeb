import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:celeb/models/response/LoginResponse.dart';
import 'package:celeb/ui/screens/login/login_navigator.dart';
import 'package:celeb/ui/screens/login/login_view_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:get/get.dart' as Get;
import 'api_service.dart';

class RemoteRepository {
  late ApiService apiService;

  RemoteRepository() {
    apiService = Get.Get.find<ApiService>();
  }

  void login(
      {required LoginNavigator listener,
      required username,
      required password}) async {
    try {
      dio.Response response = await apiService.loginUser(
          {"username": username.toString(), "password": password.toString()});
      listener.onSuccess(LoginResponse.fromJson(response.data));
    } on DioError catch (e) {
      listener.onError(e.response.toString());
    }
  }
}
