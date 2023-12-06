import 'package:bank_thing/core/domain/entities/credit_calculation_input.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation_result.dart';

abstract class CreditCalculationCalculator {
  CreditCalculationResult calculate(CreditCalculationInput input);
}
