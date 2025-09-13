import 'app_message.dart';

class Chat {
  int id;
  String? title;
  String? image;
  DateTime? startDate;
  DateTime? endDate;
  int? noOfAdults;
  int? noOfChildren;
  int? orderStatus;
  List<AppMessage?>? messages;

  Chat({
    required this.id,
    this.startDate,
    this.endDate,
    this.messages,
    this.noOfAdults,
    this.noOfChildren,
    this.orderStatus,
    this.title,
    this.image,
  });
}
