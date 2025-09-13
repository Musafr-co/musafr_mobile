import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/feature/chat/framework/chat_list/view_modal/chat_list_cubit.dart';

import '../../../../core/view/color/color.dart';
import '../../../../core/view/widgets/button/primary_button.dart';

class CreateANewTripButton extends StatelessWidget {
  const CreateANewTripButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onClick: context.read<ChatListCubit>().createNewChat,
      text: Text("Plan a new trip", style: TextStyle(
        fontWeight: FontWeight.w600, fontSize: 16, color: whiteColor
      ),),
    );
  }
}
