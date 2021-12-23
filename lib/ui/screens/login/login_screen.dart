import 'dart:async';

import 'package:celeb/constant.dart';
import 'package:celeb/ui/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel loginViewModel = LoginViewModel();

  var usernameWidth = 0.0;
  var passwordWidth = 0.0;
  static var width = 0.0;
  final Curve _curve = Curves.fastOutSlowIn;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    Future.delayed(
        const Duration(milliseconds: 500),
        () => {
              setState(() {
                usernameWidth = width;
              })
            });

    Future.delayed(
        const Duration(milliseconds: 900),
        () => {
              setState(() {
                passwordWidth = width;
              })
            });
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      loginViewModel.addListener(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DashboardScreen()));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Welcome back,",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Login",
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: AnimatedContainer(
                curve: _curve,
                duration: const Duration(milliseconds: 1000),
                width: usernameWidth,
                child: TextField(
                  controller: _usernameController,
                  style: kInputTextStyle,
                  decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: kInputHintStyle,
                      border: kInputBorder,
                      focusedBorder: kInputBorder,
                      enabledBorder: kInputBorder,
                      filled: true,
                      fillColor: kTextInputFillColor),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: _curve,
                width: passwordWidth,
                child: TextField(
                  controller: _passwordController,
                  style: kInputTextStyle,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: kInputHintStyle,
                      enabledBorder: kInputBorder,
                      focusedBorder: kInputBorder,
                      filled: true,
                      fillColor: kTextInputFillColor),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(
                "Forgot password?",
                style: kInteractiveTextStyle,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
                onTap: () async {
                  if (_usernameController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    loginViewModel.login(
                        viewModel: loginViewModel,
                        username: _usernameController.text,
                        password: _passwordController.text);
                    showModalBottomSheet(
                      context: context,
                      barrierColor: Colors.black.withAlpha(100),
                      backgroundColor: kTextInputFillColor,
                      elevation: 10,
                      isDismissible: false,
                      enableDrag: false,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 100,
                          child: Row(children: const [
                            SizedBox(
                              width: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text("Loging you in..")
                          ]),
                        );
                      },
                    );
                  }
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                  child: const Text("Login"),
                  decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
