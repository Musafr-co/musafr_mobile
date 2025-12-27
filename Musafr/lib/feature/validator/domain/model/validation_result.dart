abstract class ValidationResult{

}

class ValidationSuccess implements ValidationResult{

}

class ValidationFailure implements ValidationResult{
  String validationMessage;

  ValidationFailure({required this.validationMessage});
}