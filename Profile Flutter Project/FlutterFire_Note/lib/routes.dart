import 'package:flutter/material.dart';
import 'package:flutterfire_note/screens/home.dart';
import 'package:flutterfire_note/screens/login.dart';
import 'package:flutterfire_note/screens/signup.dart';
import 'package:flutterfire_note/screens/splash.dart';
Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>
{
  ///  Register  =>
  Splash.id : (context) => const Splash(),
  LogIn.id : (context) => const LogIn(),
  SignUp.id : (context) => const SignUp(),

  ///  Screens
  Home.id : (context) => const Home(),
};