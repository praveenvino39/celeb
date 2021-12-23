import 'package:celeb/constant.dart';
import 'package:celeb/service/remote_repository/api_service.dart';
import 'package:celeb/service/remote_repository/remote_repository.dart';
import 'package:celeb/ui/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(ApiService());
  Get.put(RemoteRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Raleway",
          colorScheme: Theme.of(context)
              .colorScheme
              .copyWith(primary: kPrimaryColor, secondary: kTextInputFillColor),
          textTheme: const TextTheme(
                  bodyText1: TextStyle(), bodyText2: TextStyle())
              .apply(bodyColor: kBodyTextColor, displayColor: kBodyTextColor)),
      home: const LoginScreen(),
    );
  }
}
