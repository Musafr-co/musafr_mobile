import 'package:musafr/feature/chat/domain/entity/hotel_offer.dart';

import 'hotel_info.dart';

class HotelDetail {
  HotelInfo? offerId;
  List<HotelOffer?>? hotelOffers;

  HotelDetail({this.offerId, this.hotelOffers});
}
