import 'package:musafr/feature/chat/data/mapper/parameters_mapper.dart';

import '../../domain/entity/app_message.dart';
import '../modal/messageDto.dart';

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
      deepSeekResponseTime: message?.deepSeekResponseTime,
      isTrigger: message?.isTrigger,
      parameters: MessageParameterMapper.fromDomain(message?.parameters),
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
      parameters: MessageParameterMapper.toDomain(message?.parameters),
    );
  }
}
