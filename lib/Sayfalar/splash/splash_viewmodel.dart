import 'package:bookstore_flutter/Sayfalar/home/homeview.dart';
import 'package:bookstore_flutter/Sayfalar/login/login_viewmodel.dart';
import 'package:bookstore_flutter/Sayfalar/login/loginview.dart';
import 'package:bookstore_flutter/Sayfalar/splash/splashview.dart';
import 'package:bookstore_flutter/project_dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SplashViewModel extends State<SplashPage> with ProjectDioMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(EnumValue.token.name);

    if (token != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => HomeView(token: widget.token)),
          (route) => false);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginView(
            token: widget.token,
          ),
        ),
      );
    }
  }
}
