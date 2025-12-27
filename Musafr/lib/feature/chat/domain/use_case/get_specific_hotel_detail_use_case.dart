

import 'package:musafr/feature/chat/domain/repository/hotel_repository.dart';

import '../../../../core/domain/model/domain_response.dart';
import '../entity/hotel_info.dart';

class GetSpecificHotelDetailUseCase{
  final HotelRepository _hotelRepository;
  GetSpecificHotelDetailUseCase(this._hotelRepository);

  Future<DomainResponse<HotelInfo?>> invoke(String hotelId){
    return _hotelRepository.getHotelById(hotelId);
  }
}