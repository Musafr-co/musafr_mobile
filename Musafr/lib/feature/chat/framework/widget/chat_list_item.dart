import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musafr/core/view/color/color.dart';

import '../../../../core/util/date_time_extesion.dart';
import '../../domain/entity/chat_detail.dart';

class ChatListItem extends StatelessWidget {
  final Chat chat;

  const ChatListItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: phoneBorderColor, width: 1),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/location.svg",
                width: 22,
                height: 22,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      chat.title ?? "",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: dividerColor,
                      ),
                    ),
                    Text(
                      "${chat.startDate != null ? formatDate(chat.startDate!) : ""} - ${chat.endDate != null ? formatDate(chat.endDate!) : ""}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: dividerColor,
                      ),
                    ),
                    Row(
                      spacing: 2,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 4, 10, 4),
                          child: Text(
                            "${chat.noOfAdults} Adults",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: dividerColor,
                            ),
                          ),
                        ),
                        Text(
                          "|",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: dividerColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                          child: Text(
                            "${chat.noOfChildren} Children",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: dividerColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
