import 'dart:async';

import 'package:celeb/models/response/LoginResponse.dart';
import 'package:celeb/service/remote_repository/remote_repository.dart';
import 'package:celeb/ui/screens/login/login_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginViewModel extends ChangeNotifier implements LoginNavigator {
  late RemoteRepository remoteRepository;

  late LoginResponse loginResponse;
  late String errorResponse;

  LoginViewModel() {
    remoteRepository = Get.find<RemoteRepository>();
  }

  void login(
      {required LoginViewModel viewModel,
      required username,
      required password}) {
    remoteRepository.login(
        listener: this, username: username, password: password);
  }

  @override
  onError(String error) {
    errorResponse = error;
    notifyListeners();
  }

  @override
  onSuccess(LoginResponse loginResponse) {
    loginResponse = loginResponse;
    notifyListeners();
  }
}
