import 'package:bank_thing/core/domain/entities/credit_calculation_input.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation_result.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculator.dart';

class DifferentiatedCreditCalculator implements CreditCalculationCalcualtor {
  DifferentiatedCreditCalculator();

  @override
  CreditCalculationResult calculate(CreditCalculationInput input) {
    final monthAmount = input.monthAmount;
    final monthCoefficient = input.monthCoefficient;
    final baseMonthyPaymentSum = input.creditSum / monthAmount;
    final coefficientSumIncrease = input.creditSum * monthCoefficient;
    final monthyPaymentSum = baseMonthyPaymentSum + coefficientSumIncrease;
    final totalSum = monthyPaymentSum * input.monthAmount;
    final overpaymentSum = totalSum - input.creditSum;
    return CreditCalculationResult(
      creditSum: input.creditSum,
      monthyPaymentSum: monthyPaymentSum,
      overpaymentSum: overpaymentSum,
      totalSum: totalSum,
    );
  }
}
