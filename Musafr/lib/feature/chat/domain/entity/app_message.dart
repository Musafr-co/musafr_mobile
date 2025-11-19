import 'package:musafr/feature/chat/domain/entity/message_parameters.dart';

import 'hotel_info.dart';

class AppMessage {
  int id;
  int? chatId;
  int? deepSeekStatus;
  int? amadeusStatus;
  String? senderRequest;
  String? senderRequestTime;
  String? deepSeekResponse;
  String? deepSeekResponseTime;
  int? isTrigger;
  MessageParameter? parameters;
  List<HotelInfo?>? hotels;

  AppMessage({required this.id,
    this.chatId,
    this.deepSeekStatus,
    this.amadeusStatus,
    this.senderRequest,
    this.senderRequestTime,
    this.deepSeekResponse,
    this.deepSeekResponseTime,
    this.isTrigger,
    this.parameters,
    this.hotels});
}
