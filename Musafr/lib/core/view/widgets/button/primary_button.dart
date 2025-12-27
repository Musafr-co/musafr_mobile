import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onClick;
  final Widget? startIcon;
  final Widget? endIcon;
  final Widget text;
  final bool enabled;
  final EdgeInsets padding;
  final double borderRadius;

  const PrimaryButton({
    super.key,
    required this.onClick,
    required this.text,
    this.startIcon,
    this.endIcon,
    this.enabled = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderRadius = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        enabled
            ? Color.fromARGB(255, 1, 115, 165)
            : Color.fromARGB(255, 200, 200, 200);
    final foregroundColor = Colors.white;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: enabled ? onClick : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (startIcon != null) ...[startIcon!, const SizedBox(width: 8)],
            Flexible(child: text),
            if (endIcon != null) ...[const SizedBox(width: 8), endIcon!],
          ],
        ),
      ),
    );
  }
}
