import 'package:musafr/feature/chat/domain/entity/message_metadata.dart';
import 'package:musafr/feature/chat/domain/entity/message_parameters.dart';

import 'hotel_info.dart';

class AppMessage {
  int id;
  int? chatId;
  int? deepSeekStatus;
  int? amadeusStatus;
  bool? isPollingNeeded;
  String? senderRequest;
  String? senderRequestTime;
  String? deepSeekResponse;
  String? deepSeekResponseTime;
  int? isTrigger;
  MessageParameter? parameters;
  MessageMetadata? metadata;
  List<HotelInfo?>? hotels;

  AppMessage({required this.id,
    this.chatId,
    this.deepSeekStatus,
    this.amadeusStatus,
    this.senderRequest,
    this.isPollingNeeded,
    this.senderRequestTime,
    this.deepSeekResponse,
    this.deepSeekResponseTime,
    this.isTrigger,
    this.metadata,
    this.parameters,
    this.hotels});
}
