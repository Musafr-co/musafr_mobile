
import '../model/validation_result.dart';

class ValidateNameUseCase{
  ValidationResult validate(String name){
    if(name.isEmpty){
      return ValidationFailure(validationMessage: "Name cannot be empty");
    }
    if(name.length < 3) {
      return ValidationFailure(
          validationMessage: "Name must be at least 3 characters long");
    }
    if(name.length > 20){
      return ValidationFailure(
          validationMessage: "Name must be at most 20 characters long");
    }
    if (!RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(name)) {
      return ValidationFailure(
          validationMessage: "Name must contain only letters, numbers, and spaces");
    }
    return ValidationSuccess();
  }
}
