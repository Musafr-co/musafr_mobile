class HotelOffer {
  String offerId;
  String hotelId;
  String? checkInDate;
  String? checkOutDate;
  String? rateCode;
  String? roomType;
  String? roomDescription;
  String? lang;
  int? guests;
  String? currency;
  int? bestPrice;
  int? totalPrice;
  String? paymentType;
  String? cancellationType;
  String? cancellationDescription;

  HotelOffer({
    required this.offerId,
    required this.hotelId,
    this.checkInDate,
    this.checkOutDate,
    this.rateCode,
    this.roomType,
    this.roomDescription,
    this.lang,
    this.guests,
    this.currency,
    this.bestPrice,
    this.totalPrice,
    this.paymentType,
    this.cancellationType,
    this.cancellationDescription,
  });
}
