import 'package:citizen_app/screen/auth/register.dart';
import 'package:citizen_app/screen/home/home.dart';
import 'package:citizen_app/screen/login/login.dart';
import 'package:citizen_app/screen/splash/splash.dart';
import 'package:citizen_app/screen/welcome/welcome.dart';
import 'package:flutter/material.dart';

final Map<String,WidgetBuilder> routes = {
  Welcome.routeName: (context) => const Welcome(),
  Login.routeName: (context) => const Login(),
  Register.routeName: (context) => const Register(),
  Home.routeName: (context) => const Home(),
  Splash.routeName: (context) => const Splash(),
};