import 'package:bank_thing/core/domain/entities/credit_calculation.dart';

abstract class CreditCalculationRepository {
  Future<List<CreditCalculation>?> getCreditCalculations();

  Future<bool> saveCreditCalculations(CreditCalculation creditCalculation);
}
