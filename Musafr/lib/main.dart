import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musafr/feature/home/framework/main/landing_screen.dart';

import 'app/application/splash/splash_screen.dart';
import 'core/di/di.dart';
import 'core/view/color/color.dart';
import 'feature/authentication/view/signIn/sign_in_screen.dart';
import 'feature/phone_number/framework/sign_in_phone_number/sign_in_phone_number_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return appWithDependencies(
      MaterialApp(
        theme: ThemeData(
          // This is the theme of your application.
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        ),
        home: SplashScreen(),
      ),
    );
  }
}