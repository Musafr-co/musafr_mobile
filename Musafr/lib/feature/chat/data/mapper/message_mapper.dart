import 'package:musafr/feature/chat/data/mapper/message_metadata_mapper.dart';
import 'package:musafr/feature/chat/data/mapper/parameters_mapper.dart';

import '../../domain/entity/app_message.dart';
import '../modal/message_dto.dart';
import 'hotel_mapper.dart';

class MessageMapper {
  static MessageDto fromDomain(AppMessage? message) {
    return MessageDto(
      id: message?.id ?? -1,
      chatId: message?.chatId,
      deepSeekStatus: message?.deepSeekStatus,
      amadeusStatus: message?.amadeusStatus,
      senderRequest: message?.senderRequest,
      senderRequestTime: message?.senderRequestTime,
      deepSeekResponse: message?.deepSeekResponse,
      isPollingNeeded: message?.isPollingNeeded,
      deepSeekResponseTime: message?.deepSeekResponseTime,
      isTrigger: message?.isTrigger,
      parameters: MessageParameterMapper.fromDomain(message?.parameters),
      metadata: MessageMetadataMapper.fromDomain(message?.metadata),
    );
  }

  static AppMessage toDomain(MessageDto? message) {
    return AppMessage(
      id: message?.id ?? -1,
      chatId: message?.chatId,
      deepSeekStatus: message?.deepSeekStatus,
      amadeusStatus: message?.amadeusStatus,
      senderRequest: message?.senderRequest,
      senderRequestTime: message?.senderRequestTime,
      deepSeekResponse: message?.deepSeekResponse,
      deepSeekResponseTime: message?.deepSeekResponseTime,
      isTrigger: message?.isTrigger,
      isPollingNeeded: message?.isPollingNeeded,
      parameters: MessageParameterMapper.toDomain(message?.parameters),
      metadata: MessageMetadataMapper.toDomain(message?.metadata),
      hotels: message?.hotels?.map((e) => HotelMapper.toDomain(e!)).toList(),
    );
  }
}
