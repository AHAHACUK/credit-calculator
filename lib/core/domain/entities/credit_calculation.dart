import 'package:bank_thing/core/domain/entities/credit_calculation_input.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation_result.dart';

class CreditCalculation {
  final CreditCalculationInput input;
  final CreditCalculationResult result;
  final DateTime createdTime;

  CreditCalculation({
    required this.input,
    required this.result,
    required this.createdTime,
  });
}
