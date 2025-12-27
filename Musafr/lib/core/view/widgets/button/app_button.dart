import 'package:flutter/material.dart';
import 'package:musafr/core/view/ui_state/ui_state.dart';

import '../error/error_text.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onClick;
  final Widget? startIcon;
  final Widget? endIcon;
  final Widget text;
  final UiState<bool> enabledState;
  final Color containerColor;
  final Color contentColor;
  final Color disabledContainerColor;
  final Color disabledContentColor;
  final EdgeInsets padding;
  final double borderRadius;

  const AppButton({
    super.key,
    required this.onClick,
    required this.text,
    this.startIcon,
    this.endIcon,
    required this.enabledState,
    required this.containerColor,
    required this.contentColor,
    required this.disabledContainerColor,
    required this.disabledContentColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderRadius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        enabledState.data ?? false ? containerColor : disabledContainerColor;
    final foregroundColor =
        enabledState.data ?? false ? contentColor : disabledContentColor;

    return Stack(
      children: [
        Column(
          children: [
            ElevatedButton(
              onPressed: enabledState.data ?? false ? onClick : null,
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
                  if (startIcon != null) ...[
                    startIcon!,
                    const SizedBox(width: 8),
                  ],
                  Flexible(child: text),
                  if (endIcon != null) ...[const SizedBox(width: 8), endIcon!],
                ],
              ),
            ),
            if (enabledState is UiError)
              ErrorText(text: (enabledState as UiError).message),
          ],
        ),
        if (enabledState is UiLoading)
          Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
