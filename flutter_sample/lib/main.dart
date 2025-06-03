import 'package:flutter/material.dart';
import 'package:sam/screen/ScreenView.dart';
import 'package:sam/screen/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MainActivity();
  }
}