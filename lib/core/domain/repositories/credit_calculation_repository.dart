import 'package:bank_thing/core/domain/entities/credit_calculation.dart';

abstract class CreditCalculationRepository {
  CreditCalculation calculate({
    required double creditSum,
    required double yearsAmount,
    required double yearCoefficient,
  });
}
