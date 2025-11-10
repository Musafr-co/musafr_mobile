import 'package:musafr/feature/chat/data/modal/MessageParamsDto.dart';
import 'package:musafr/feature/chat/data/modal/hotel_dto.dart';

class MessageDto {
  int id;
  int? chatId;
  int? deepSeekStatus;
  int? amadeusStatus;
  String? senderRequest;
  String? senderRequestTime;
  String? deepSeekResponse;
  String? deepSeekResponseTime;
  String? isTrigger;
  MessageParamsDto? parameters;
  List<HotelDto?>? hotels;
  MessageDto({
    required this.id,
    this.chatId,
    this.deepSeekStatus,
    this.amadeusStatus,
    this.senderRequest,
    this.senderRequestTime,
    this.deepSeekResponse,
    this.deepSeekResponseTime,
    this.isTrigger,
    this.parameters,
    this.hotels,
  });
}
