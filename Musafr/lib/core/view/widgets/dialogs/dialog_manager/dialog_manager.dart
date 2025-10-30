import 'package:flutter/material.dart';

class DialogManager {
  DialogManager._();
  static final DialogManager instance = DialogManager._();

  final List<BuildContext> _dialogContexts = [];

  bool get hasAnyDialog => _dialogContexts.isNotEmpty;

  Future<T?> show<T>(
      BuildContext context,
      WidgetBuilder builder, {
        bool barrierDismissible = false,
      }) {
    _dialogContexts.add(context);
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      useRootNavigator: true,
      barrierColor: Colors.transparent,
      builder: (ctx) {
        return builder(ctx);
      },
    ).whenComplete(() {
      if (_dialogContexts.isNotEmpty) {
        _dialogContexts.removeLast();
      }
    });
  }

  void hideTop(BuildContext context) {
    if (_dialogContexts.isEmpty) return;
    try {
      Navigator.of(context, rootNavigator: true).pop();
    } catch (_) {}
  }

  void hideAll(BuildContext context) {
    while (_dialogContexts.isNotEmpty) {
      try {
        Navigator.of(context, rootNavigator: true).pop();
      } catch (_) {}
      _dialogContexts.removeLast();
    }
  }
}
