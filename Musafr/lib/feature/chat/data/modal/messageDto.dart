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
  int? isTrigger;
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

  factory MessageDto.fromJson(Map<String, dynamic> json) {
    try {
      return MessageDto(
        id: json['id'],
        chatId: json['chatId'],
        deepSeekStatus: json['deekSeekStatus'],
        amadeusStatus: json['amadeusStatus'],
        senderRequest: json['senderRequest'],
        senderRequestTime: json['senderRequestTime'],
        deepSeekResponse: json['deepSeekResponse'],
        deepSeekResponseTime: json['deepSeekResponseTime'],
        isTrigger: json['isTrigger'],
        parameters: MessageParamsDto.fromJson(json['parameters'] ?? {}),
        hotels: List<HotelDto>.from(
          json['hotels'].map((x) => HotelDto.fromJson(x ?? {})),
        ),
      );
    }catch(exception){
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chat_id': chatId,
      'deep_seek_status': deepSeekStatus,
      'amadeus_status': amadeusStatus,
      'sender_request': senderRequest,
      'sender_request_time': senderRequestTime,
      'deep_seek_response': deepSeekResponse,
      'deep_seek_response_time': deepSeekResponseTime,
      'is_trigger': isTrigger,
      'parameters': parameters?.toJson(),
      'hotels': hotels?.map((e) => e?.toJson()).toList(),
    };
  }
}
