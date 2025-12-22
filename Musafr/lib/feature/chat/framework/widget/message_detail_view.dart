import 'package:flutter/material.dart';

import '../../../../core/view/color/color.dart';
import '../../domain/entity/app_message.dart';
import 'hotel/hotelListView.dart';

class MessageDetailView extends StatelessWidget {
  final AppMessage message;

  const MessageDetailView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: messageFromUserColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.zero,
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                child: Text(
                  message.senderRequest?.toString() ?? "",
                  style: TextStyle(fontSize: 14, color: titleTextColor),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              if (message.deepSeekResponse != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 10,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: messageFromServerColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                      child: Text(
                        message.deepSeekResponse?.toString() ?? "",
                        style: TextStyle(fontSize: 14, color: titleTextColor),
                      ),
                    ),
                  ),
                ),
              if (message.isPollingNeeded == true)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 10,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: CircularProgressIndicator(),
                  ),
                ),
              if (message.hotels?.isNotEmpty ?? false)
                HotelListView(hotels: message.hotels),
            ],
          ),
        ),
      ],
    );
  }
}
