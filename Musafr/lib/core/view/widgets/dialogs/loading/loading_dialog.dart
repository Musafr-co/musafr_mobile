import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dialog_manager/dialog_manager.dart';

class LoadingDialogListener<C extends BlocBase<S>, S>
    extends BlocListener<C, S> {
  LoadingDialogListener({
    super.key,
    required bool Function(S state) isLoading,
    required WidgetBuilder loadingBuilder,
  }) : super(
         listenWhen: (_, _) => true,
         listener: (context, state) {
           if (isLoading(state)) {
             DialogManager.instance.show(
               context,
               loadingBuilder,
               barrierDismissible: false,
             );
           } else {
             DialogManager.instance.hideTop(context);
           }
         },
       );
}
