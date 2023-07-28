import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _nameController = TextEditingController();

@override
void dispose() {
  _emailController.dispose();
  _nameController.dispose();
  _passwordController.dispose();
}

class NameFormField extends StatelessWidget {
  const NameFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Color(0xFFF4F4FF),
          hintText: 'John Doe',
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name';
          }
          return null;
        },
      ),
    );
  }
}

class EmailFormField extends StatelessWidget {
  const EmailFormField({super.key, this.validator});
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        validator: validator,
        controller: _emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Color(0xFFF4F4FF),
          hintText: 'john@mail.com',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({super.key, this.validator});
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        validator: validator,
        obscureText: true,
        controller: _passwordController,
        keyboardType: TextInputType.visiblePassword,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Color(0xFFF4F4FF),
          hintText: '**********',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class SearchFormField extends StatelessWidget {
  const SearchFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Color(0xff090937).withOpacity(0.4)),
        obscureText: true,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Color(0xFFF4F4FF),
          border: InputBorder.none,
          hintText: 'Search',
          suffixIcon: Icon(Icons.tune),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

class LoginRegisterSizedBox extends StatelessWidget {
  const LoginRegisterSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 65,
      child: SvgPicture.asset('assets/images/logo.svg'),
    );
  }
}

// class PasswordTextField extends StatelessWidget {
//   final String? Function(String?)? validator;
//   final bool? obscureText;

//   const PasswordTextField({this.validator, this.obscureText});

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       validator: validator,
//       obscureText: obscureText ?? false,
//       controller: _passwordController,
//       keyboardType: TextInputType.visiblePassword,
//       decoration: const InputDecoration(
//         filled: true,
//         fillColor: Color(0xFFF4F4FF),
//         hintText: '**********',
//         border: InputBorder.none,
//       ),
//     );
//   }
// }
