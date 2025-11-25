

import '../../domain/entity/hotel_info.dart';
import '../modal/hotel_dto.dart';

class HotelMapper {
  static HotelDto fromDomain(HotelInfo hotel) {
    return HotelDto(id: hotel.id,
    rating:  hotel.rating,
    amenities:  hotel.amenities,
    radiusUnit:  hotel.radiusUnit,
    radius:  hotel.radius,
    addressLine:  hotel.addressLine,
    chainCode:  hotel.chainCode,
    cityName:  hotel.cityName,
    countryCode:  hotel.countryCode,
    hotelId:  hotel.hotelId,
    iataCode:  hotel.iataCode,
    lastUpdate:  hotel.lastUpdate,
    latitude:  hotel.latitude,
    longitude:  hotel.longitude,
    name:  hotel.name,
    postalCode:  hotel.postalCode,);
  }

  static HotelInfo toDomain(HotelDto hotel) {
    return HotelInfo(id: hotel.id,
      rating:  hotel.rating,
      amenities:  hotel.amenities,
      radiusUnit:  hotel.radiusUnit,
      radius:  hotel.radius,
      addressLine:  hotel.addressLine,
      chainCode:  hotel.chainCode,
      cityName:  hotel.cityName,
      countryCode:  hotel.countryCode,
      hotelId:  hotel.hotelId,
      iataCode:  hotel.iataCode,
      lastUpdate:  hotel.lastUpdate,
      latitude:  hotel.latitude,
      longitude:  hotel.longitude,
      name:  hotel.name,
      postalCode:  hotel.postalCode,);
  }
}
