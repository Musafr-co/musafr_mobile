
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musafr/core/data/model/network_response.dart';
import 'package:musafr/core/view/ui_state/ui_state.dart';
import 'package:musafr/feature/hotel/domain/repository/hotel_repository.dart';
import 'package:musafr/feature/hotel/data/modal/hotel_offer_response_dto.dart';
import 'hotel_offer_state.dart';

class HotelOfferCubit extends Cubit<HotelOfferState> {
  final HotelRepository hotelRepository;
  final String hotelId;
  final String checkInDate;
  final int guests;
  final int roomQuantity;

  HotelOfferCubit(
    this.hotelRepository, {
    required this.hotelId,
    required this.checkInDate,
    required this.guests,
    required this.roomQuantity,
  }) : super(HotelOfferState.initial()) {
    getOffers();
  }

  Future<void> getOffers() async {
    emit(state.copyWith(screenState: UiLoading()));
    final response = await hotelRepository.getHotelOffers(
      hotelId: hotelId,
      checkInDate: checkInDate,
      guests: guests,
      roomQuantity: roomQuantity,
    );

    if (response is NetworkSuccess) {
      var data = (response as NetworkSuccess<HotelOfferResponseDto>).data!;
      // Use dummy data if API returns empty
      if (data.hotel == null || data.offers == null || data.offers!.isEmpty) {
        data = _getDummyData();
      }
      emit(state.copyWith(screenState: UiSuccess(data: data)));
    } else {
      // Use dummy data on error
      emit(state.copyWith(screenState: UiSuccess(data: _getDummyData())));
    }
  }

  void incrementRoomQuantity(String offerId) {
    final newQuantities = Map<String, int>.from(state.roomQuantities);
    newQuantities[offerId] = (newQuantities[offerId] ?? 0) + 1;
    emit(state.copyWith(roomQuantities: newQuantities));
  }

  void decrementRoomQuantity(String offerId) {
    final newQuantities = Map<String, int>.from(state.roomQuantities);
    final current = newQuantities[offerId] ?? 0;
    if (current > 0) {
      newQuantities[offerId] = current - 1;
      emit(state.copyWith(roomQuantities: newQuantities));
    }
  }

  HotelOfferResponseDto _getDummyData() {
    return HotelOfferResponseDto(
      hotel: HotelDto(
        id: 1,
        hotelId: "NOBU_DOHA",
        name: "Nobu Doha",
        rating: 4.4,
        addressLine: "23979, West Bay Lagoon",
        cityName: "Doha",
        countryCode: "QA",
        latitude: 25.3167,
        longitude: 51.5167,
        amenities: "Parking,Spa,Pool,Dinner",
      ),
      offers: [
        OfferDto(
          offerId: "single_001",
          hotelId: "NOBU_DOHA",
          roomType: "Single Bedroom",
          roomDescription: "Tea/Coffee, Shower, AC",
          guests: 1,
          currency: "QAR",
          bestPrice: 325,
          totalPrice: 325,
          checkInDate: checkInDate,
        ),
        OfferDto(
          offerId: "double_001",
          hotelId: "NOBU_DOHA",
          roomType: "Double Bedroom",
          roomDescription: "Tea/Coffee, Shower, AC, TV, WiFi",
          guests: 2,
          currency: "QAR",
          bestPrice: 400,
          totalPrice: 400,
          checkInDate: checkInDate,
        ),
        OfferDto(
          offerId: "studio_001",
          hotelId: "NOBU_DOHA",
          roomType: "Studio Apartment",
          roomDescription: "Tea/Coffee, Shower, AC, TV, WiFi",
          guests: 3,
          currency: "QAR",
          bestPrice: 500,
          totalPrice: 500,
          checkInDate: checkInDate,
        ),
      ],
    );
  }
}
