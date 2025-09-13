import 'package:musafr/feature/chat/domain/entity/chat_detail.dart';

import '../modal/chat_dto.dart';

class ChatMapper {
  static ChatDto fromDomain(Chat chat) {
    return ChatDto(
      id: chat.id,
      title: chat.title ?? "",
      startDate: chat.startDate,
      endDate: chat.endDate,
      noOfAdults: chat.noOfAdults,
      noOfChildren: chat.noOfChildren,
      orderStatus: chat.orderStatus,
      // messages: chat.messages,
    );
  }

  static Chat toDomain(ChatDto chatDto) {
    return Chat(
      id: chatDto.id,
      title: chatDto.title,
      startDate: chatDto.startDate,
      endDate: chatDto.endDate,
      noOfAdults: chatDto.noOfAdults,
      noOfChildren: chatDto.noOfChildren,
      orderStatus: chatDto.orderStatus,
      // messages: chatDto.messages,
    );
  }
}
