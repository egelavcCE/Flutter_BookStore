import 'package:bookstore_flutter/Sayfalar/login/login_service.dart';
import 'package:bookstore_flutter/Sayfalar/login/loginview.dart';
import 'package:bookstore_flutter/project_dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum EnumValue { token }

abstract class LoginViewModel extends State<LoginView> with ProjectDioMixin {
  late final ILoginService loginService;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? token;
  bool rememberMe = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // ignore: avoid_print
    super.dispose();
  }

  LoginViewModel() {
    loginService = LoginService(service);
  }

  Future<void> loginButton(String email, String password) async {
    token = await loginService.login(email, password);

    rememberMe ? await saveToken(token ?? "") : null;
  }

  Future<void> saveToken(String myToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(EnumValue.token.name, myToken);
  }
}
