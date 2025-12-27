import 'package:musafr/feature/chat/domain/entity/hotel_info.dart';

import '../../../../core/domain/model/domain_response.dart';

abstract class HotelRepository {
  Future<DomainResponse<HotelInfo?>> getHotelById(String id);

  Future<DomainResponse<HotelInfo?>> getHotelOffersForHotel(
    String hotelId,
    String checkInDate,
    int noOfGuest,
    int roomQuantity,
  );


}
