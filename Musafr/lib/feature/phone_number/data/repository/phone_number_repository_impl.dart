import 'package:dlibphonenumber/generated/classes/phone_number/phonenumber.pb.dart';
import 'package:dlibphonenumber/phone_number_util.dart';
import 'package:musafr/core/domain/model/domain_response.dart';
import 'package:musafr/feature/phone_number/domain/repository/phone_number_repository.dart';

class PhoneNumberRepositoryImpl extends PhoneNumberRepository {
  final PhoneNumberUtil phoneNumberUtil = PhoneNumberUtil.instance;

  PhoneNumberRepositoryImpl();

  @override
  Future<DomainResponse<bool>> validatePhoneNumber(
    String number,
    String region,
  ) async {
    try {
      final phoneNumber = phoneNumberUtil.parse(number, region);
      final isValid = phoneNumberUtil.isValidNumberForRegion(
          phoneNumber, region);
      if (isValid) {
        return DomainSuccess(true);
      } else {
        return DomainFailure(error: 'Please enter a valid number', data: false);
      }
    } catch(exception){
      return DomainFailure(error: exception.toString(), data: false);
    }
  }

  @override
  Future<DomainResponse<String>> getPlaceholderForRegion(String region) {
    final PhoneNumber? examplePhoneNumber = phoneNumberUtil.getExampleNumber(
      region,
    );
    if (examplePhoneNumber == null) {
      return Future.value(
        DomainFailure(error: 'Please enter a valid region', data: region),
      );
    }

    return Future.value(
      DomainSuccess(examplePhoneNumber.nationalNumber.toString()),
    );
  }
}
