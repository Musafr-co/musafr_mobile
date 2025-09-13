import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musafr/core/view/ui_state/ui_state.dart';

import '../../../../core/view/widgets/edit_text/app_edit_text.dart';

class ReferralCodeEditText extends StatelessWidget {
  final String value;
  final ValueChanged<String> onTextUpdate;

  const ReferralCodeEditText({
    super.key,
    required this.value,
    required this.onTextUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return AppEditText(
      value: UiSuccess(data: value),
      onTextUpdate: onTextUpdate,
      startView: SizedBox(
        height: 4,
        width: 4,
        child: SvgPicture.asset(
          "assets/icons/ticket-expired.svg",
          semanticsLabel: 'Referral Text',
        ),
      ),
      placeholder: "Referral Code (Optional)",
    );
  }
}
