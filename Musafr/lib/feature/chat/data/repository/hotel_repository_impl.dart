

import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/chat/domain/entity/hotel_info.dart';
import 'package:musafr/feature/chat/domain/repository/hotel_repository.dart';

class HotelRepositoryImpl extends HotelRepository{
  @override
  Future<DomainResponse<HotelInfo>> getHotelById(String id) {
    // TODO: implement getHotelById
    throw UnimplementedError();
  }

  @override
  Future<DomainResponse<HotelInfo?>> getHotelOffersForHotel(String hotelId, String checkInDate, int noOfGuest, int roomQuantity) {

    // TODO: implement getHotelOffersForHotel
    throw UnimplementedError();
  }



}