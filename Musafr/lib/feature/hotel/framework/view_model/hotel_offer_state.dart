
import 'package:musafr/core/view/ui_state/ui_state.dart';
import 'package:musafr/feature/hotel/data/modal/hotel_offer_response_dto.dart';

class HotelOfferState {
  final UiState<HotelOfferResponseDto> screenState;
  final Map<String, int> roomQuantities;

  HotelOfferState({
    required this.screenState,
    this.roomQuantities = const {},
  });

  HotelOfferState.initial()
      : screenState = UiIdle(),
        roomQuantities = {};

  double get totalPrice {
    if (screenState is! UiSuccess) return 0;
    final data = (screenState as UiSuccess<HotelOfferResponseDto>).data;
    double total = 0;
    
    data.offers?.forEach((offer) {
      if (offer.offerId != null) {
        final quantity = roomQuantities[offer.offerId] ?? 0;
        final price = (offer.totalPrice ?? offer.bestPrice ?? 0).toDouble();
        total += quantity * price;
      }
    });
    
    return total;
  }

  HotelOfferState copyWith({
    UiState<HotelOfferResponseDto>? screenState,
    Map<String, int>? roomQuantities,
  }) {
    return HotelOfferState(
      screenState: screenState ?? this.screenState,
      roomQuantities: roomQuantities ?? this.roomQuantities,
    );
  }
}
