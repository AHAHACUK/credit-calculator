import 'package:bank_thing/core/domain/entities/credit_calculation_input.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation_result.dart';

class SaveCreditCalculationDto {
  final CreditCalculationInput input;
  final CreditCalculationResult result;

  SaveCreditCalculationDto({
    required this.input,
    required this.result,
  });
}
