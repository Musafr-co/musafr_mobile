import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/core/view/color/color.dart';
import 'package:musafr/feature/user/view/user_top_bar/view_modal/logged_in_user_cubit.dart';
import 'package:musafr/feature/user/view/user_top_bar/view_modal/logged_in_user_state.dart';
import 'package:musafr/feature/user/view/user_top_bar/widget/user_image.dart';

import '../../../../core/view/ui_state/ui_state.dart';
import '../../domain/modal/user_modal.dart';

class LoggedInUserTopBar extends StatelessWidget {
  const LoggedInUserTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      LoggedInUserCubit,
      LoggedInUserState,
      UiState<UserModal?>
    >(
      selector: (state) => state.currentUser,
      builder: (BuildContext context, userModal) {
        return Row(
          spacing: 16,
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: UserImage(userModal: userModal.data),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(
                    "Hi Welcome 👋",
                    style: TextStyle(fontSize: 14, color: dividerColor),
                  ),
                  Text(
                    userModal.data?.name ?? "User Name",
                    style: TextStyle(
                      fontSize: 16,
                      color: titleTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Icon(
                size: 20,
                Icons.favorite_outline,
                color: dividerColor,
              ),
            ),
            GestureDetector(
              child: Icon(
                size: 20,
                Icons.notifications_outlined,
                color: dividerColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
