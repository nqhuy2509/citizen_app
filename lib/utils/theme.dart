
import 'package:flutter/material.dart';


const Color primaryColor = Color(0xFF00BCD4);


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
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: primaryColor),
    titleTextStyle: TextStyle(color: primaryColor, fontSize: 20),
  ),
);
