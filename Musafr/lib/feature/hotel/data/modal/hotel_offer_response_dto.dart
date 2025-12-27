
class HotelOfferResponseDto {
  HotelDto? hotel;
  List<OfferDto>? offers;

  HotelOfferResponseDto({this.hotel, this.offers});

  HotelOfferResponseDto.fromJson(Map<String, dynamic> json) {
    hotel = json['hotel'] != null ? HotelDto.fromJson(json['hotel']) : null;
    if (json['offers'] != null) {
      offers = <OfferDto>[];
      json['offers'].forEach((v) {
        offers!.add(OfferDto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (hotel != null) {
      data['hotel'] = hotel!.toJson();
    }
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotelDto {
  int? id;
  String? hotelId;
  String? name;
  String? chainCode;
  String? iataCode;
  double? latitude;
  double? longitude;
  String? addressLine;
  String? cityName;
  String? countryCode;
  String? postalCode;
  num? radius;
  String? radiusUnit;
  num? rating;
  String? amenities;
  String? lastUpdate;

  HotelDto(
      {this.id,
      this.hotelId,
      this.name,
      this.chainCode,
      this.iataCode,
      this.latitude,
      this.longitude,
      this.addressLine,
      this.cityName,
      this.countryCode,
      this.postalCode,
      this.radius,
      this.radiusUnit,
      this.rating,
      this.amenities,
      this.lastUpdate});

  HotelDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hotelId = json['hotelId'];
    name = json['name'];
    chainCode = json['chainCode'];
    iataCode = json['iataCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    addressLine = json['addressLine'];
    cityName = json['cityName'];
    countryCode = json['countryCode'];
    postalCode = json['postalCode'];
    radius = json['radius'];
    radiusUnit = json['radiusUnit'];
    rating = json['rating'];
    amenities = json['amenities'];
    lastUpdate = json['lastUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['hotelId'] = hotelId;
    data['name'] = name;
    data['chainCode'] = chainCode;
    data['iataCode'] = iataCode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['addressLine'] = addressLine;
    data['cityName'] = cityName;
    data['countryCode'] = countryCode;
    data['postalCode'] = postalCode;
    data['radius'] = radius;
    data['radiusUnit'] = radiusUnit;
    data['rating'] = rating;
    data['amenities'] = amenities;
    data['lastUpdate'] = lastUpdate;
    return data;
  }
}

class OfferDto {
  String? offerId;
  String? hotelId;
  String? checkInDate;
  String? checkOutDate;
  String? rateCode;
  String? roomType;
  String? roomDescription;
  String? lang;
  int? guests;
  String? currency;
  num? bestPrice;
  num? totalPrice;
  String? paymentType;
  String? cancellationType;
  String? cancellationDescription;

  OfferDto(
      {this.offerId,
      this.hotelId,
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
      this.cancellationDescription});

  OfferDto.fromJson(Map<String, dynamic> json) {
    offerId = json['offerId'];
    hotelId = json['hotelId'];
    checkInDate = json['checkInDate'];
    checkOutDate = json['checkOutDate'];
    rateCode = json['rateCode'];
    roomType = json['roomType'];
    roomDescription = json['roomDescription'];
    lang = json['lang'];
    guests = json['guests'];
    currency = json['currency'];
    bestPrice = json['bestPrice'];
    totalPrice = json['totalPrice'];
    paymentType = json['paymentType'];
    cancellationType = json['cancellationType'];
    cancellationDescription = json['cancellationDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['offerId'] = offerId;
    data['hotelId'] = hotelId;
    data['checkInDate'] = checkInDate;
    data['checkOutDate'] = checkOutDate;
    data['rateCode'] = rateCode;
    data['roomType'] = roomType;
    data['roomDescription'] = roomDescription;
    data['lang'] = lang;
    data['guests'] = guests;
    data['currency'] = currency;
    data['bestPrice'] = bestPrice;
    data['totalPrice'] = totalPrice;
    data['paymentType'] = paymentType;
    data['cancellationType'] = cancellationType;
    data['cancellationDescription'] = cancellationDescription;
    return data;
  }
}
