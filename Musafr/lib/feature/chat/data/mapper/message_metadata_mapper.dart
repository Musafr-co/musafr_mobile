import 'package:musafr/feature/chat/data/modal/Message_params_dto.dart';
import 'package:musafr/feature/chat/data/modal/message_metadata_dto.dart';
import 'package:musafr/feature/chat/domain/entity/message_metadata.dart';
import 'package:musafr/feature/chat/domain/entity/message_parameters.dart';

class MessageMetadataMapper {
  static MessageMetaDataDto fromDomain(MessageMetadata? parameter) {
    return MessageMetaDataDto(
      location: parameter?.location,
      guestsCount: parameter?.guestsCount,
      roomsQuantity: parameter?.roomsQuantity,
      checkInDate: parameter?.checkInDate,
      checkOutDate: parameter?.checkOutDate,
    );
  }

  static MessageMetadata toDomain(MessageMetaDataDto? dto) {
    return MessageMetadata(
      location: dto?.location,
      guestsCount: dto?.guestsCount,
      roomsQuantity: dto?.roomsQuantity,
      checkInDate: dto?.checkInDate,
      checkOutDate: dto?.checkOutDate,
    );
  }
}
