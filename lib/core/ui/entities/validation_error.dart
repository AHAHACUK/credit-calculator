abstract class ValidationError {}

class FormatValidationError implements ValidationError {}

class ZeroValidationError implements ValidationError {}

class EmptyValidationError implements ValidationError {}

class TooLargeValidationError implements ValidationError {
  final String maximumStringRepresentation;

  TooLargeValidationError(this.maximumStringRepresentation);
}
