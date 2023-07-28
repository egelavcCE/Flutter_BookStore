import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GTheme {
  final gTheme = ThemeData(
    appBarTheme: AppBarTheme(
      toolbarHeight: 92.h,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Color(0xff090937)),
      elevation: 0,
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.manrope(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: const Color(0xff090937),
      ),
      headlineMedium: GoogleFonts.manrope(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xff090937),
      ),
      headlineSmall: GoogleFonts.manrope(
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xff090937).withOpacity(0.6),
      ),
      titleMedium: GoogleFonts.manrope(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: const Color(0xff090937).withOpacity(0.6),
      ),
      titleSmall: GoogleFonts.manrope(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: const Color(0xff6251DD),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEF6B4A),
          textStyle: GoogleFonts.manrope(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xffFFFFFF))),
    ),
  );
}
