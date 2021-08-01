import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomColor {
  static const Color white = Color(0xFFFFFFFF);
  static const Color fontBlack = Color(0xDE000000);
  static const Color logoBlue = Color(0xFF2196F3);
  static const Color textFieldBackground = Color(0x1E000000);
  static const Color hintColor = Color(0x99000000);
  static const Color statusBarColor = Color(0x1e000000);
}

class CustomTheme {
  static ThemeData mainTheme = ThemeData(
    // Default brightness and colors.
    brightness: Brightness.light,
    primaryColor: CustomColor.logoBlue,
    accentColor: Colors.cyan[600],

    // Default font family.
    fontFamily: GoogleFonts.lato().fontFamily,

    // Default TextTheme. Use this to specify the default
    // text styling for headlines, titles, bodies of text, and etc.
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
        color: CustomColor.fontBlack,
      ),
      headline2: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
        color: CustomColor.fontBlack,
      ),
      headline3: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: CustomColor.fontBlack,
      ),
      headline4: TextStyle(
        fontSize: 10.sp,
        color: CustomColor.logoBlue,
      ),
      headline5: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
      headline6: TextStyle(
        fontSize: 8.sp,
        fontWeight: FontWeight.bold,
        color: CustomColor.logoBlue,
      ),
      bodyText1: TextStyle(fontSize: 14.sp, color: CustomColor.fontBlack),
      bodyText2: TextStyle(fontSize: 12.sp, color: CustomColor.hintColor),
      button: TextStyle(
        color: CustomColor.white,
        fontFamily: GoogleFonts.lato().fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        letterSpacing: 2,
      ),
    ),
  );
}
