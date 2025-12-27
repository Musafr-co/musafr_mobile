import 'package:flutter/material.dart';

import '../../../../core/view/ui_state/ui_state.dart';
import '../../../../core/view/widgets/edit_text/app_edit_text.dart';

class PhoneNumberEditText extends StatelessWidget {
  final UiState<String> value;
  final ValueChanged<String> onTextUpdate;
  final String? placeholder;
  final double? height;
  final Widget? endView;
  final TextAlign textAlign;
  final InputDecoration? decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int minLines;
  final int? maxLines;
  final bool enabled;
  final TextStyle? textStyle;

  const PhoneNumberEditText({
    super.key,
    required this.value,
    required this.onTextUpdate,
    this.placeholder,
    this.endView,
    this.textAlign = TextAlign.start,
    this.decoration,
    this.keyboardType = TextInputType.number,
    this.textInputAction = TextInputAction.done,
    this.minLines = 1,
    this.maxLines,
    this.enabled = true,
    this.height,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppEditText(
      value: value,
      onTextUpdate: onTextUpdate,
      placeholder: placeholder,
      endView: endView,
      textAlign: textAlign,
      decoration: decoration,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      minLines: minLines,
      maxLines: maxLines,
      enabled: enabled,
      height: height,
    );
  }
}
