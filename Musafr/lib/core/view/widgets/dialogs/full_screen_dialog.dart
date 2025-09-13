import 'package:flutter/material.dart';

class DialogNavigator extends StatefulWidget {
  final bool showDialog;
  final Widget Function(BuildContext) dialogBuilder;

  const DialogNavigator({
    super.key,
    required this.showDialog,
    required this.dialogBuilder,
  });

  @override
  State<DialogNavigator> createState() => _DialogNavigatorState();
}

class _DialogNavigatorState extends State<DialogNavigator> {
  final GlobalKey<OverlayState> _overlayKey = GlobalKey<OverlayState>();
  OverlayEntry? _dialogEntry;

  @override
  void didUpdateWidget(covariant DialogNavigator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.showDialog && _dialogEntry == null) {
      _showDialog();
    } else if (!widget.showDialog && _dialogEntry != null) {
      _hideDialog();
    }
  }

  @override
  void dispose() {
    _hideDialog();
    super.dispose();
  }

  void _showDialog() {
    _dialogEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: Material(
          color: Colors.black54, // barrier
          child: Center(child: widget.dialogBuilder(context)),
        ),
      ),
    );
    _overlayKey.currentState?.insert(_dialogEntry!);
  }

  void _hideDialog() {
    _dialogEntry?.remove();
    _dialogEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Overlay(
        key: _overlayKey,
        initialEntries: [
          OverlayEntry(
            builder: (context) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}


OverlayEntry showFullScreenOverlay(
    BuildContext context, {
      required WidgetBuilder builder,
      Color barrierColor = Colors.black54,
      bool dismissible = true,
    }) {
  final overlay = Overlay.of(context);
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) => Stack(
      children: [
        // barrier
        if (dismissible)
          Positioned.fill(
            child: GestureDetector(
              onTap: () => entry.remove(),
              child: Container(color: barrierColor),
            ),
          )
        else
          Positioned.fill(child: Container(color: barrierColor)),

        // dialog content
        Center(child: builder(context)),
      ],
    ),
  );

  overlay.insert(entry);
  return entry;
}
