import 'package:citi_zen_app/constants/color.dart';
import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: primaryColor,
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    suffixIconColor: primaryColor,
    prefixIconColor: primaryColor,
  ),
);
