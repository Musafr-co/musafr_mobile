import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musafr/core/view/ui_state/ui_state.dart';
import 'package:musafr/core/view/widgets/edit_text/app_edit_text.dart';

class PasswordEditText extends StatelessWidget {
  final UiState<String> value;
  final ValueChanged<String> onTextUpdate;
  final ValueChanged<bool> onShowTextClicked;
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
  final bool showText;
  final TextStyle? textStyle;

  const PasswordEditText({
    super.key,
    required this.value,
    required this.onTextUpdate,
    required this.onShowTextClicked,
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
    required this.showText,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final updatedState =
        !showText
            ? value.data
            : value.data?.replaceRange(0, value.data?.length, "*");
    final state = value.copyWithData(updatedState ?? "");
    return AppEditText(
      value: state,
      onTextUpdate: onTextUpdate,
      startView: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          "assets/icons/lock.svg",
          semanticsLabel: 'Password Input',
          width: 22,
          height: 22,
        ),
      ),
      placeholder: placeholder,
      endView: GestureDetector(
        onTap: () {
          onShowTextClicked(!showText);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            !showText
                ? "assets/icons/hide_pass.svg"
                : "assets/icons/show_pass.svg",
            semanticsLabel: 'hide_show_pass',
            width: 22,
            height: 22,
          ),
        ),
      ),
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

class PasswordEditTextWithHide extends StatefulWidget {
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

  const PasswordEditTextWithHide({
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
  });

  @override
  State<PasswordEditTextWithHide> createState() => _PasswordEditTextWithHideState();
}

class _PasswordEditTextWithHideState extends State<PasswordEditTextWithHide> {
  bool showText = true;


  void onShowTextClicked(bool show) {
    setState(() {
      showText = show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppEditText(
      value: widget.value,
      onTextUpdate: widget.onTextUpdate,
      startView: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          "assets/icons/lock.svg",
          semanticsLabel: 'Password Input',
          width: 22,
          height: 22,
        ),
      ),
      placeholder: widget.placeholder,
      endView: GestureDetector(
        onTap: () {
          onShowTextClicked(!showText);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            !showText
                ? "assets/icons/hide_pass.svg"
                : "assets/icons/show_pass.svg",
            semanticsLabel: 'hide_show_pass',
            width: 22,
            height: 22,
          ),
        ),
      ),
      textAlign: widget.textAlign,
      obscureText: showText,
      decoration: widget.decoration,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      enabled: widget.enabled,
    );
  }
}

