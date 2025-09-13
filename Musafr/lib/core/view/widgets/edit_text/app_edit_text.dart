import 'package:flutter/material.dart';
import 'package:musafr/core/view/color/color.dart';
import 'package:musafr/core/view/ui_state/ui_state.dart';

class AppEditText extends StatelessWidget {
  final UiState<String> value;
  final ValueChanged<String> onTextUpdate;
  final String? placeholder;
  final Widget? startView;
  final Widget? endView;
  final TextAlign textAlign;
  final InputDecoration? decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int minLines;
  final bool obscureText;
  final int? maxLines;
  final bool enabled;
  final TextStyle? textStyle;
  final double? height;

  const AppEditText({
    super.key,
    required this.value,
    required this.onTextUpdate,
    this.obscureText = false,
    this.placeholder,
    this.startView,
    this.endView,
    this.textAlign = TextAlign.start,
    this.decoration,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.minLines = 1,
    this.maxLines,
    this.enabled = true,
    this.textStyle,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: value.data ?? "",
                  selection: TextSelection.collapsed(
                    offset: value.data?.length ?? 0,
                  ),
                ),
              ),
              onChanged: onTextUpdate,
              textAlign: textAlign,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              minLines: minLines,
              maxLines: minLines < 2 ? 1 : maxLines,
              obscureText: obscureText,
              enabled: enabled,
              style:
                  textStyle ??
                  theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: enabled ? dividerColor : theme.disabledColor,
                  ),
              decoration:
                  decoration ??
                  InputDecoration(
                    hintText: placeholder,
                    hintStyle: TextStyle(color: placeHolderColor),
                    prefixIcon: startView,
                    suffixIcon: endView,
                    constraints: BoxConstraints(
                      maxHeight: height ?? double.infinity,
                    ),
                    errorText:
                        value is UiError ? (value as UiError).message : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: phoneBorderColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: phoneBorderColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: phoneBorderColor,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: phoneBorderColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: phoneBorderColor,
                        width: 2.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                  ),
            ),
          ],
        ),
        if (value is UiLoading)
          Positioned.fill(child: Center(child: CircularProgressIndicator())),
      ],
    );
  }
}
