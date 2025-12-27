import 'package:flutter/material.dart';
import 'package:musafr/core/view/color/color.dart';

import '../../../domain/modal/user_modal.dart';

class UserImage extends StatelessWidget {
  final UserModal? userModal;

  const UserImage({super.key, required this.userModal});

  @override
  Widget build(BuildContext context) {
    final image = userModal?.profilePicture;
    return CircleAvatar(
      backgroundImage: NetworkImage(image ?? "https://picsum.photos/400/400"),
      backgroundColor: primaryColor,
      child:
          image != null
              ? SizedBox()
              : Text(userModal?.name??"UN", style: TextStyle(color: whiteColor)),
    );
  }
}
