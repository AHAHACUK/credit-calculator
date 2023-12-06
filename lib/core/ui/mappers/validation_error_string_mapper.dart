import 'package:bank_thing/app_localizations.dart';
import 'package:bank_thing/core/ui/entities/validation_error.dart';

class ValidationErrorStringMapper {
  late final AppLocalizations _loc;

  ValidationErrorStringMapper(AppLocalizations loc) {
    _loc = loc;
  }
  String? call(ValidationError? error) {
    if (error == null) return null;
    if (error is EmptyValidationError) {
      return _loc.validationErrorEmpty;
    } else if (error is ZeroValidationError) {
      return _loc.validationErrorZero;
    } else if (error is FormatValidationError) {
      return _loc.validationErrorFormat;
    } else if (error is TooLargeValidationError) {
      return _loc.validationErrorTooLarge(error.maximumStringRepresentation);
    } else {
      throw Exception(
          "No string representation found for this ValidationError: ${error}");
    }
  }
}
