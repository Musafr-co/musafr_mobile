import 'package:musafr/feature/validator/domain/model/validation_result.dart';

class ValidateEmailUseCase {
  ValidationResult validate(String email) {
    if (email.isEmpty) {
      return ValidationFailure(validationMessage: "Email can't be empty.");
    }

    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return ValidationFailure(validationMessage: "Invalid email format.");
    }

    return ValidationSuccess(); // No error
  }
}
