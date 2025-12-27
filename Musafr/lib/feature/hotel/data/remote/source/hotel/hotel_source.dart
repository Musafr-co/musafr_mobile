
import 'package:musafr/core/data/model/network_response.dart';

import 'package:musafr/feature/hotel/data/modal/hotel_offer_response_dto.dart';

abstract class HotelRemoteSource {
  Future<NetworkResponse<HotelOfferResponseDto>> getHotelOffers({
    required String hotelId,
    required String checkInDate,
    required int guests,
    required int roomQuantity,
  });
}
