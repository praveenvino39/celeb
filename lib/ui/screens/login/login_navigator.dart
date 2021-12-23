import 'package:celeb/models/response/LoginResponse.dart';

abstract class LoginNavigator {
  onSuccess(LoginResponse loginResponse);
  onError(String error);
}
