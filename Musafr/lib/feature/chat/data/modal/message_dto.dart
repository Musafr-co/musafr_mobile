import 'package:musafr/feature/chat/data/modal/Message_params_dto.dart';
import 'package:musafr/feature/chat/data/modal/hotel_dto.dart';
import 'package:musafr/feature/chat/data/modal/message_metadata_dto.dart';

class MessageDto {
  int id;
  int? chatId;
  int? deepSeekStatus;
  int? amadeusStatus;
  String? senderRequest;
  String? senderRequestTime;
  String? deepSeekResponse;
  String? deepSeekResponseTime;
  bool? isPollingNeeded;
  int? isTrigger;
  MessageParamsDto? parameters;
  MessageMetaDataDto? metadata;
  List<HotelDto?>? hotels;

  MessageDto({
    required this.id,
    this.chatId,
    this.deepSeekStatus,
    this.amadeusStatus,
    this.senderRequest,
    this.senderRequestTime,
    this.isPollingNeeded,
    this.deepSeekResponse,
    this.metadata,
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
        isPollingNeeded: json['isPollingNeeded'],
        deepSeekResponse: json['deepSeekResponse'],
        deepSeekResponseTime: json['deepSeekResponseTime'],
        isTrigger: json['isTrigger'],
        parameters: MessageParamsDto.fromJson(json['parameters'] ?? {}),
        metadata: MessageMetaDataDto.fromJson(json['metadata'] ?? {}),
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
      'isPollingNeeded': isPollingNeeded,
      'sender_request_time': senderRequestTime,
      'deep_seek_response': deepSeekResponse,
      'deep_seek_response_time': deepSeekResponseTime,
      'metadata': metadata?.toJson(),
      'is_trigger': isTrigger,
      'parameters': parameters?.toJson(),
      'hotels': hotels?.map((e) => e?.toJson()).toList(),
    };
  }
}
