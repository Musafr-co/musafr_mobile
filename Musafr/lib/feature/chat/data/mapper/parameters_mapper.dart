import 'package:musafr/feature/chat/data/modal/Message_params_dto.dart';
import 'package:musafr/feature/chat/domain/entity/message_parameters.dart';

class MessageParameterMapper {
  static MessageParamsDto fromDomain(MessageParameter? parameter) {
    return MessageParamsDto(
      cityCode: parameter?.cityCode ?? "",
      radius: parameter?.radius,
      radiusUnit: parameter?.radiusUnit,
      amenities: parameter?.amenities,
      rating: parameter?.rating,
      hotelSource: parameter?.hotelSource,
    );
  }

  static MessageParameter toDomain(MessageParamsDto? dto) {
    return MessageParameter(
      cityCode: dto?.cityCode ?? "",
      radius: dto?.radius,
      radiusUnit: dto?.radiusUnit,
      amenities: dto?.amenities,
      rating: dto?.rating,
      hotelSource: dto?.hotelSource,
    );
  }
}
