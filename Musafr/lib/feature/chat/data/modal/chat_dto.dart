import 'package:musafr/feature/chat/data/modal/messageDto.dart';

class ChatDto {
  int id;
  String? title;
  DateTime? startTime;
  DateTime? endTime;
  int? noOfAdults;
  int? noOfChildren;
  int? orderStatus;
  List<MessageDto>? messages;

  ChatDto({
    required this.id,
    this.title,
    this.startTime,
    this.endTime,
    this.noOfAdults,
    this.noOfChildren,
    this.orderStatus,
    this.messages,
  });
}
