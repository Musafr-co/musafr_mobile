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

  factory ChatDto.fromJson(Map<String, dynamic> json) {
    return ChatDto(
      id: json['id'],
      title: json['title'],
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      noOfAdults: json['noOfAdults'],
      noOfChildren: json['noOfChildren'],
      orderStatus: json['orderStatus'],
      messages:
          (json['messages'] as List<dynamic>?)
              ?.map((item) => MessageDto.fromJson(item))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'startTime': startTime?.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'noOfAdults': noOfAdults,
      'noOfChildren': noOfChildren,
      'orderStatus': orderStatus,
      'messages': messages?.map((message) => message.toJson()).toList(),
    };
  }
}
