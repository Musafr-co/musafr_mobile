import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dialog_manager/dialog_manager.dart';

void showErrorDialog({
  required BuildContext context,
  required String errorMessage,
  required ValueChanged<void> onAcknowledge,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    // dismiss when tapped outside
    barrierColor: Colors.black.withOpacity(0.5),
    // background overlay color
    builder: (context) {
      return Scaffold(
        backgroundColor: Colors.black45,
        body: Center(
          child: AlertDialog(
            title: const Text('Error'),
            content: SingleChildScrollView(
              child: ListBody(children: <Widget>[Text(errorMessage)]),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  onAcknowledge(null);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

class ErrorDialogListener<C extends BlocBase<S>, S> extends BlocListener<C, S> {
  ErrorDialogListener({
    super.key,
    required Object? Function(S state) screenStateSelector,
    required bool Function(S state) shouldShowError,
    required String Function(S state) errorMessageSelector,
    required void Function() onAcknowledge,
    Widget Function(
      BuildContext context,
      String message,
      VoidCallback acknowledge,
    )?
    errorDialogBuilder,
  }) : super(
         listenWhen:
             (previous, current) =>
                 screenStateSelector(previous) !=
                     screenStateSelector(current) &&
                 shouldShowError(current),
         listener: (context, state) {
           final message = errorMessageSelector(state);

           Future.microtask(() {
             DialogManager.instance.show(context, (ctx) {
               void acknowledge() {
                 DialogManager.instance.hideTop(ctx);
                 onAcknowledge();
               }

               if (errorDialogBuilder != null) {
                 return errorDialogBuilder(ctx, message, acknowledge);
               }

               return AlertDialog(
                 title: const Text("Error"),
                 content: Text(message),
                 actions: [
                   TextButton(onPressed: acknowledge, child: const Text("OK")),
                 ],
               );
             }, barrierDismissible: false);
           });
         },
       );
}
