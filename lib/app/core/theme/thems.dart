import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//Anubis@#1212
class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: Color(0xff263A6D),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xff514BC3),
      ),
    ),
    // cardColor: Colors.amber,
    // canvasColor: Colors.amber,
    highlightColor: Colors.black87,
    // focusColor: const Color(0xff04D9F1),
    indicatorColor: Color(0xff102129),
   
    textTheme: TextTheme(
      bodyMedium: TextStyle(
        color: Colors.black87,
        fontSize: 25.sp,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: Colors.black87,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.black87,
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        color: Colors.black87,
        fontSize: 20.sp,
        fontWeight: FontWeight.normal,
        fontFamily: 'AM',
      ),
      labelMedium: TextStyle(
        color: Colors.black87,
        fontSize: 17.sp,
        fontWeight: FontWeight.normal,
        fontFamily: 'AM',
      ),
    ),
    colorScheme: ThemeData()
        .colorScheme
        .copyWith(
            secondary: Color(0xff514BC3),
            primary: Color(0xff514BC3),
            onSurface: Color(0xff514BC3))
        .copyWith(background: const Color(0xff0D1724))
        .copyWith(secondary: Colors.black),
    // colorScheme: ColorScheme.fromSwatch().copyWith(
    //   secondary:  Colors.white,
    //   primary: Colors.white,
    // ),
  );
}
