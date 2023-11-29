import 'package:bank_thing/core/domain/entities/credit_calculation.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation_repository.dart';

class DifferentiatedCreditCalculationRepository
    implements CreditCalculationRepository {
  DifferentiatedCreditCalculationRepository();

  @override
  CreditCalculation calculate({
    required double creditSum,
    required double yearsAmount,
    required double yearCoefficient,
  }) {
    final monthAmount = yearsAmount * 12;
    final monthCoefficient = yearCoefficient / 12;
    final baseMonthyPaymentSum = creditSum / monthAmount;
    final coefficientSumIncrease = creditSum * monthCoefficient;
    final monthyPaymentSum = baseMonthyPaymentSum + coefficientSumIncrease;
    final totalSum = monthyPaymentSum * 12 * yearsAmount;
    final overpaymentSum = totalSum - creditSum;
    return CreditCalculation(
      creditSum: creditSum,
      monthyPaymentSum: monthyPaymentSum,
      overpaymentSum: overpaymentSum,
      totalSum: totalSum,
    );
  }
}
