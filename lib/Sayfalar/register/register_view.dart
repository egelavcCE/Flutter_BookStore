import 'package:bookstore_flutter/Components/button.dart';
import 'package:bookstore_flutter/Components/padding.dart';
import 'package:bookstore_flutter/Components/textfield.dart';
import 'package:bookstore_flutter/Sayfalar/register/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends RegisterViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: constraint.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: LoginViewPadding().loginViewPadding,
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const LoginRegisterSizedBox(),
                    SizedBox(height: 115.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                    color: Color(0xff090937).withOpacity(0.6))),
                        Text('Register an Account',
                            style: Theme.of(context).textTheme.headlineLarge),
                        SizedBox(height: 80.h),
                        Text(
                          'Name',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const NameFormField(),
                        SizedBox(height: 24.h),
                        Text(
                          'E-mail',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        EmailFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24.h),
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        PasswordTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButtonStyle(
                            onPressed: () {
                              Navigator.pushNamed(context, '/loginRoute');
                            },
                            buttonText: 'Login',
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 60.h),
                      ),
                      onPressed: isRegistering ? null : registers,
                      child: isRegistering
                          ? CircularProgressIndicator()
                          : const Text(
                              'Register',
                              // style: Theme.of(context).textTheme.headlineMedium,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }));
  }
}
