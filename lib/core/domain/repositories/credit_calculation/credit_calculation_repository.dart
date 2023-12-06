import 'package:bank_thing/core/domain/entities/credit_calculation.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation/save_credit_calculation_dto.dart';

abstract class CreditCalculationRepository {
  Future<List<CreditCalculation>?> getCreditCalculations();

  Future<bool> saveCreditCalculations(
      SaveCreditCalculationDto creditCalculationDto);

  Future<bool> deleteCreditCalculation(CreditCalculation creditCalculation);
}
