import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GButton extends StatelessWidget {
  const GButton(
      {super.key, this.onPressed, required this.buttonText, this.secondText});
  final void Function()? onPressed;
  final String buttonText;
  final String? secondText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 60.h),
      ),
      child: secondText == null
          ? Text(
              buttonText ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Color(0xffFFFFFF)),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(buttonText), Text(secondText!)],
            ),
    );
  }
}

class TextButtonStyle extends StatelessWidget {
  const TextButtonStyle({super.key, this.onPressed, this.buttonText});
  final void Function()? onPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      child: Text(buttonText ?? ''),
    );
  }
}
