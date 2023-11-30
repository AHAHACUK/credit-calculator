import 'package:bank_thing/core/domain/entities/credit_calculation.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation_repository.dart';

class MemoryCreditCalculationRepository implements CreditCalculationRepository {
  final Duration? simulateDelay;
  final List<CreditCalculation> _calculations = [];

  MemoryCreditCalculationRepository({this.simulateDelay});

  @override
  Future<List<CreditCalculation>?> getCreditCalculations() async {
    if (simulateDelay != null) await Future.delayed(simulateDelay!);
    return _calculations;
  }

  @override
  Future<bool> saveCreditCalculations(
    CreditCalculation creditCalculation,
  ) async {
    if (simulateDelay != null) await Future.delayed(simulateDelay!);
    _calculations.add(creditCalculation);
    return true;
  }
}
