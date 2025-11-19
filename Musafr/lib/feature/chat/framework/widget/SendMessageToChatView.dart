import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musafr/core/view/color/color.dart';

import '../../../../core/view/ui_state/ui_state.dart';
import '../../../../core/view/widgets/edit_text/app_edit_text.dart';

class SendMessageToChatEditText extends StatefulWidget {
  final UiState<String> value;
  final ValueChanged<String> onTextUpdate;
  final String? placeholder;
  final Widget? endView;
  final String? error;
  final TextAlign textAlign;
  final InputDecoration? decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int minLines;
  final int? maxLines;
  final bool enabled;
  final TextStyle? textStyle;
  final Function() onMessageSend;

  const SendMessageToChatEditText({
    super.key,
    required this.value,
    required this.onTextUpdate,
    this.placeholder,
    this.endView,
    this.error,
    this.textAlign = TextAlign.start,
    this.decoration,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.minLines = 1,
    this.maxLines,
    this.enabled = true,
    this.textStyle,
    required this.onMessageSend,
  });

  @override
  State<SendMessageToChatEditText> createState() =>
      _SendMessageToChatEditText();
}

class _SendMessageToChatEditText extends State<SendMessageToChatEditText> {

  @override
  Widget build(BuildContext context) {
    return AppEditText(
      value: widget.value,
      onTextUpdate: widget.onTextUpdate,
      placeholder: widget.placeholder,
      endView: GestureDetector(
        onTap: () {
          widget.onMessageSend();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                     "assets/icons/send_message_icon.svg",
                semanticsLabel: 'hide_show_pass',
                width: 22,
                height: 22,
              ),
            ),
          ),
        ),
      ),
      textAlign: widget.textAlign,
      obscureText: false,
      decoration: widget.decoration,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      enabled: widget.enabled,
    );
  }
}
