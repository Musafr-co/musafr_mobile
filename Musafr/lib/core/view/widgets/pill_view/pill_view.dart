import 'package:flutter/material.dart';

import '../../color/color.dart';

class PillView extends StatelessWidget {
  final Widget child;

  const PillView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: pillColor,
      ),
      child: child,
    );
  }
}
