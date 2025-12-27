import 'package:flutter/material.dart';

import 'app/application/splash/splash_screen.dart';
import 'core/di/di.dart';
import 'core/view/color/color.dart';

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
          fontFamily: "Poppins",
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
