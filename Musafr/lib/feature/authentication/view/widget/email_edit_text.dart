import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/view/ui_state/ui_state.dart';
import '../../../../core/view/widgets/edit_text/app_edit_text.dart';

class EmailEditText extends StatelessWidget {
  final UiState<String> value;
  final ValueChanged<String> onTextUpdate;
  final String? placeholder;
  final Widget? endView;
  final TextAlign textAlign;
  final InputDecoration? decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int minLines;
  final int? maxLines;
  final bool enabled;
  final TextStyle? textStyle;

  const EmailEditText({
    super.key,
    required this.value,
    required this.onTextUpdate,
    this.placeholder,
    this.endView,
    this.textAlign = TextAlign.start,
    this.decoration,
    this.keyboardType = TextInputType.emailAddress,
    this.textInputAction = TextInputAction.done,
    this.minLines = 1,
    this.maxLines,
    this.enabled = true,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppEditText(
      value: value,
      onTextUpdate: onTextUpdate,
      startView: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          "assets/icons/sms.svg",
          semanticsLabel: 'Email Input',
          width: 22,
          height: 22,
        ),
      ),
      placeholder: placeholder,
      endView: endView,
      textAlign: textAlign,
      decoration: decoration,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      minLines: minLines,
      maxLines: maxLines,
      enabled: enabled,
    );
  }
}
