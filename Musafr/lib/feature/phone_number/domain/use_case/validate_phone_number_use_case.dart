import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/phone_number/domain/repository/phone_number_repository.dart';

import '../../../validator/domain/model/validation_result.dart';

class ValidatePhoneNumberUseCase {
  final PhoneNumberRepository phoneNumberRepository;

  ValidatePhoneNumberUseCase(this.phoneNumberRepository);

  Future<ValidationResult> validate(String phoneNumber, String region) async {
    if (phoneNumber.isEmpty) {
      return ValidationFailure(validationMessage: 'Phone number cannot be empty.');
    }
    if (region.isEmpty) {
      return ValidationFailure(validationMessage: 'Region cannot be empty.');
    }
    final result = await phoneNumberRepository.validatePhoneNumber(phoneNumber, region);
    if(result is DomainFailure){
      return ValidationFailure(validationMessage: (result as DomainFailure).error);
    }
    return ValidationSuccess(); // No error
  }
}
