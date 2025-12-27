import 'package:flutter/material.dart';

import '../../color/color.dart';

class ContinueWithSocialButton extends StatelessWidget {
  final VoidCallback onClick;
  final Widget? startIcon;
  final Widget? endIcon;
  final String text;
  final bool enabled;

  const ContinueWithSocialButton({
    super.key,
    required this.onClick,
    required this.text,
    required this.enabled,
    required this.startIcon,
    required this.endIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: dividerColor, width: 1),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            startIcon!,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }
}
