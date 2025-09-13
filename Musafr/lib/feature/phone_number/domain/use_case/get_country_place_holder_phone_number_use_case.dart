import 'package:musafr/feature/phone_number/domain/repository/phone_number_repository.dart';

import '../../../../core/domain/model/domain_response.dart';

class GetCountryPlaceHolderPhoneNumberUseCase {
  final PhoneNumberRepository phoneNumberRepository;

  GetCountryPlaceHolderPhoneNumberUseCase(this.phoneNumberRepository);
  Future<DomainResponse<String>> invoke(String region) async {
    return await phoneNumberRepository.getPlaceholderForRegion(region);
  }
}
