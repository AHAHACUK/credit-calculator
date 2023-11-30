import 'package:bank_thing/core/domain/entities/crecit_calculation_method.dart';

class CreditCalculationInput {
  final double creditSum;
  final double monthAmount;
  final double monthCoefficient;
  final CredicCalculationMethod credicCalculationMethod;

  CreditCalculationInput({
    required this.creditSum,
    required this.monthAmount,
    required this.monthCoefficient,
    required this.credicCalculationMethod,
  });
}
