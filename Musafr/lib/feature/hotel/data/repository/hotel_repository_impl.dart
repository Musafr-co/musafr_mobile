
import 'package:musafr/core/data/model/network_response.dart';
import 'package:musafr/feature/hotel/data/modal/hotel_offer_response_dto.dart';
import 'package:musafr/feature/hotel/data/remote/source/hotel/hotel_source.dart';
import 'package:musafr/feature/hotel/domain/repository/hotel_repository.dart';

class HotelRepositoryImpl extends HotelRepository {
  final HotelRemoteSource hotelRemoteSource;

  HotelRepositoryImpl(this.hotelRemoteSource);

  @override
  Future<NetworkResponse<HotelOfferResponseDto>> getHotelOffers({
    required String hotelId,
    required String checkInDate,
    required int guests,
    required int roomQuantity,
  }) {
    return hotelRemoteSource.getHotelOffers(
      hotelId: hotelId,
      checkInDate: checkInDate,
      guests: guests,
      roomQuantity: roomQuantity,
    );
  }
}
