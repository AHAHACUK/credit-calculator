import 'package:bank_thing/core/domain/entities/crecit_calculation_method.dart';

class CreditCalculationInput {
  final double creditSum;
  final double monthAmount;
  final double monthCoefficient;
  final CreditCalculationMethod creditCalculationMethod;

  CreditCalculationInput({
    required this.creditSum,
    required this.monthAmount,
    required this.monthCoefficient,
    required this.creditCalculationMethod,
  });
}
