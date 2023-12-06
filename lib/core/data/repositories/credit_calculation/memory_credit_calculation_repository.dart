import 'package:bank_thing/core/domain/entities/credit_calculation.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation/credit_calculation_repository.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation/save_credit_calculation_dto.dart';

class MemoryCreditCalculationRepository implements CreditCalculationRepository {
  final Duration? simulateDelay;
  final List<CreditCalculation> _calculations = [];

  int _idCounter = 0;

  MemoryCreditCalculationRepository({this.simulateDelay});

  @override
  Future<List<CreditCalculation>?> getCreditCalculations() async {
    if (simulateDelay != null) await Future.delayed(simulateDelay!);
    return _calculations;
  }

  @override
  Future<bool> saveCreditCalculations(
    SaveCreditCalculationDto creditCalculationDto,
  ) async {
    if (simulateDelay != null) await Future.delayed(simulateDelay!);
    final creditCalculation = CreditCalculation(
      id: _idCounter,
      input: creditCalculationDto.input,
      result: creditCalculationDto.result,
      createdTime: DateTime.now(),
    );
    _calculations.add(creditCalculation);
    _idCounter += 1;
    return true;
  }

  @override
  Future<bool> deleteCreditCalculation(
    CreditCalculation creditCalculation,
  ) async {
    if (simulateDelay != null) await Future.delayed(simulateDelay!);
    final removeResult = _calculations.remove(creditCalculation);
    return removeResult;
  }
}
