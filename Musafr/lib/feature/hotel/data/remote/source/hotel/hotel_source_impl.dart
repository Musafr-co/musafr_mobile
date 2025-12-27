
import 'package:musafr/core/data/model/network_response.dart';
import 'package:musafr/core/network/data/client/api_client.dart';
import 'package:musafr/feature/hotel/data/modal/hotel_offer_response_dto.dart';
import 'package:musafr/feature/hotel/data/remote/source/hotel/hotel_source.dart';

class HotelRemoteSourceImpl extends HotelRemoteSource {
  final ApiClient apiClient;

  HotelRemoteSourceImpl(this.apiClient);

  @override
  Future<NetworkResponse<HotelOfferResponseDto>> getHotelOffers({
    required String hotelId,
    required String checkInDate,
    required int guests,
    required int roomQuantity,
  }) async {
    final response = await apiClient.post(
      "api/v1/hotel/hotel-offers",
      data: {
        "hotelId": hotelId,
        "checkInDate": checkInDate,
        "guests": guests,
        "roomQuantity": roomQuantity,
      },
    );

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      try {
        final hotelOffer = HotelOfferResponseDto.fromJson(response.data);
        return NetworkSuccess<HotelOfferResponseDto>(
          hotelOffer,
          "Success",
          response.statusCode!,
        );
      } catch (exception) {
        return NetworkException(exception as Exception);
      }
    } else {
      return NetworkFailure(
        error: response.statusMessage ?? response.data,
        data: null,
      );
    }
  }
}
