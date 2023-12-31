import 'package:citizen_app/screen/verification/verification.dart';
import 'package:citizen_app/screen/register/register.dart';
import 'package:citizen_app/screen/home/home.dart';
import 'package:citizen_app/screen/login/login.dart';
import 'package:citizen_app/screen/profile/profile.dart';
import 'package:citizen_app/screen/splash/splash.dart';
import 'package:citizen_app/screen/welcome/welcome.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  Welcome.routeName: (context) => const Welcome(),
  Login.routeName: (context) => Login(),
  Register.routeName: (context) => Register(),
  Home.routeName: (context) => const Home(),
  Splash.routeName: (context) => const Splash(),
  Profile.routeName: (context) => Profile(),
  Verification.routeName: (context) => Verification(),
};
