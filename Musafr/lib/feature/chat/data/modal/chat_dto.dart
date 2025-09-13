class ChatDto {
  int id;
  String? title;
  DateTime? startDate;
  DateTime? endDate;
  int? noOfAdults;
  int? noOfChildren;
  int? orderStatus;
  List<String?>? messages;

  ChatDto({
    required this.id,
    this.title,
    this.startDate,
    this.endDate,
    this.noOfAdults,
    this.noOfChildren,
    this.orderStatus,
    this.messages,
  });
}
