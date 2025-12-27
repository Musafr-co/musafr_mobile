import 'package:musafr/feature/validator/domain/model/validation_result.dart';

class ValidatePasswordUseCase {
  ValidationResult validate(String password) {
    if (password.isEmpty) {
      return ValidationFailure(validationMessage: "Password can't be empty.");
    }

    if (password.length < 8) {
      return ValidationFailure(
        validationMessage: "Password must be at least 8 characters long.",
      );
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return ValidationFailure(
        validationMessage:
            "Password must include at least one uppercase letter.",
      );
    }

    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return ValidationFailure(
        validationMessage:
            "Password must include at least one lowercase letter.",
      );
    }

    if (!RegExp(r'\d').hasMatch(password)) {
      return ValidationFailure(
        validationMessage: "Password must include at least one number.",
      );
    }

    // Optional: Check for special character
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return ValidationFailure(
        validationMessage:
            "Password must include at least one special character.",
      );
    }

    return ValidationSuccess();
  }
}
