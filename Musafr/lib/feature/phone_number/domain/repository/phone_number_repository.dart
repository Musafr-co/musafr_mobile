import 'package:musafr/core/domain/model/domain_response.dart';

abstract class PhoneNumberRepository {
  Future<DomainResponse<String>> getPlaceholderForRegion(String region);

  Future<DomainResponse<bool>> validatePhoneNumber(
    String number,
    String region,
  );
}
