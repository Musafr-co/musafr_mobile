import 'package:flutter/material.dart';
import 'package:musafr/core/view/color/color.dart';

import '../../../../core/util/date_time_extesion.dart';
import '../../../../core/view/widgets/pill_view/pill_view.dart';
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
          borderRadius: BorderRadius.circular(16),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(chat.image ?? "https://picsum.photos/400/400"),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Text(
                      chat.title ?? "",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: titleTextColor,
                      ),
                    ),
                    Text(
                      "${chat.startDate != null ? formatDate(chat.startDate!) : ""} - ${chat.endDate != null ? formatDate(chat.endDate!) : ""}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: dividerColor,
                      ),
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        PillView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                            child: Text(
                              "${chat.noOfAdults} Adults",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: dividerColor,
                              ),
                            ),
                          ),
                        ),
                        PillView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                            child: Text(
                              "${chat.noOfChildren} Children",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: dividerColor,
                              ),
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
