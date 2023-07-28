import 'dart:core';

import 'package:bookstore_flutter/Components/button.dart';
import 'package:bookstore_flutter/Components/padding.dart';
import 'package:bookstore_flutter/Components/textfield.dart';
import 'package:bookstore_flutter/Sayfalar/home/homeview.dart';
import 'package:bookstore_flutter/Sayfalar/login/login_viewmodel.dart';
import 'package:bookstore_flutter/Sayfalar/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.token});
  final String token;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: LoginViewPadding().loginViewPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: LoginRegisterSizedBox(),
                      ),
                      SizedBox(height: 115.h),
                      Text('Welcome Back!',
                          style: Theme.of(context).textTheme.headlineMedium),
                      Text('Login To Your Account',
                          style: Theme.of(context).textTheme.headlineLarge),
                      SizedBox(height: 80.h),
                      Text(
                        'E-mail',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const EmailFormField(),
                      SizedBox(height: 24.h),
                      Text(
                        'Password',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const PasswordTextField(),
                      Row(
                        children: [
                          Expanded(
                            child: CheckboxListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                              value: rememberMe,
                              onChanged: (newValue) {
                                setState(() {
                                  rememberMe = newValue!;
                                });
                              },
                              title: const Text('Remember Me'),
                            ),
                          ),
                          TextButtonStyle(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterView()));
                            },
                            buttonText: 'Register',
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox(height: 10.h)),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 60.h),
                        ),
                        onPressed: () async {
                          await loginButtonPressed();
                          if (token!.isEmpty || token == null) {
                            // ignore: use_build_context_synchronously
                            await showDialogBox(context);
                          } else {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeView(token: token!)),
                                (route) => route.isFirst);
                          }
                        },
                        child: Text(
                          'Login',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> showDialogBox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Error"),
        contentPadding: EdgeInsets.all(20),
      ),
    );
  }

  Future<void> loginButtonPressed() {
    return loginButton(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }
}
