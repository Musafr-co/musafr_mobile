import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musafr/feature/home/framework/main/landing_screen.dart';

import 'core/di/di.dart';
import 'core/view/color/color.dart';
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

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _topPosition = 0; // offset for icon animation
  double _opacity = 0;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      setState(() {
        _topPosition =
            -MediaQuery.of(context).size.height / 2 +
            70; // move up by 150 pixels
      });
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        color: _opacity < 1 ? primaryColor : whiteColor,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              top: MediaQuery.of(context).size.height / 2 + _topPosition,
              child: Stack(
                alignment: Alignment.center,
                fit: StackFit.passthrough,
                children: [
                  _opacity < 1
                      ? SvgPicture.asset(
                        'assets/icons/app_icon.svg',
                        width: 120,
                      )
                      : SvgPicture.asset(
                        'assets/icons/app_icon_dark.svg',
                        width: 120,
                      ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 120, 16, 16),
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _opacity,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: SignInPhoneNumberScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
