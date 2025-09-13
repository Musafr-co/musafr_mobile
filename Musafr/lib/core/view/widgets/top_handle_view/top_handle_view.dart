import 'package:flutter/material.dart';

import '../../color/color.dart';

class TopHandle extends StatelessWidget {
  const TopHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Container(
        width: 100,
        height: 5,
        decoration: BoxDecoration(
          color: editTextBorder,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}