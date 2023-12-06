import 'package:bank_thing/core/data/repositories/credit_calculation/memory_credit_calculation_repository.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation/credit_calculation_repository.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

void setupGetIt() {
  _getIt.registerSingleton<CreditCalculationRepository>(
    MemoryCreditCalculationRepository(
      simulateDelay: const Duration(seconds: 1),
    ),
  );
}
