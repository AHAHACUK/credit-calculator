import 'package:bank_thing/app_localizations.dart';
import 'package:bank_thing/core/ui/entities/validation_error.dart';

class ValidationErrorStringMapper {
  late final Map<ValidationError, String> dict;

  ValidationErrorStringMapper(AppLocalizations loc) {
    dict = {
      ValidationError.format: loc.validationErrorFormat,
      ValidationError.zero: loc.validationErrorZero,
      ValidationError.empty: loc.validationErrorEmpty,
    };
  }
  String? call(ValidationError? error) {
    if (error == null) return null;
    final errorString = dict[error];
    if (errorString == null) {
      throw Exception(
          "No string representation found for this ValidationError: ${error}");
    }
    return errorString;
  }
}
