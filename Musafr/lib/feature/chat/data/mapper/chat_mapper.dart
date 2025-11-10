import 'package:musafr/feature/chat/domain/entity/chat_detail.dart';

import '../modal/chat_dto.dart';
import 'message_mapper.dart';

class ChatMapper {
  static ChatDto fromDomain(Chat chat) {
    return ChatDto(
      id: chat.id,
      title: chat.title ?? "",
      startTime: chat.startDate,
      endTime: chat.endDate,
      noOfAdults: chat.noOfAdults,
      noOfChildren: chat.noOfChildren,
      orderStatus: chat.orderStatus,
      messages: chat.messages?.map((e) => MessageMapper.fromDomain(e)).toList(),
    );
  }

  static Chat toDomain(ChatDto chatDto) {
    return Chat(
      id: chatDto.id,
      title: chatDto.title,
      startDate: chatDto.startTime,
      endDate: chatDto.endTime,
      noOfAdults: chatDto.noOfAdults,
      noOfChildren: chatDto.noOfChildren,
      orderStatus: chatDto.orderStatus,
      messages:
          chatDto.messages?.map((e) => MessageMapper.toDomain(e)).toList(),
    );
  }
}
