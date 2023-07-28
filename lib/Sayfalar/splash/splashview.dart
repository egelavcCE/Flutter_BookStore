import 'dart:io';

import 'package:bookstore_flutter/Components/button.dart';
import 'package:bookstore_flutter/Sayfalar/splash/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.token});
  final String token;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends SplashViewModel {
  //
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D1D4E),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Center(child: SvgPicture.asset('assets/images/logo.svg'))),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: GButton(
                      onPressed: () async {
                        await getToken();
                      },
                      buttonText: 'Login',
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        exit(0);
                      },
                      child: Text(
                        'Skip',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Color(0xff6251DD)),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
