import 'package:bank_thing/core/domain/entities/credit_calculation_input.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation_result.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculator.dart';

class DifferentiatedCreditCalculator implements CreditCalculationCalculator {
  DifferentiatedCreditCalculator();

  @override
  CreditCalculationResult calculate(CreditCalculationInput input) {
    final monthAmount = input.monthAmount;
    final monthCoefficient = input.monthCoefficient;
    final baseMonthlyPaymentSum = input.creditSum / monthAmount;
    final coefficientSumIncrease = input.creditSum * monthCoefficient;
    final monthlyPaymentSum = baseMonthlyPaymentSum + coefficientSumIncrease;
    final totalSum = monthlyPaymentSum * input.monthAmount;
    final overpaymentSum = totalSum - input.creditSum;
    return CreditCalculationResult(
      creditSum: input.creditSum,
      monthlyPaymentSum: monthlyPaymentSum,
      overpaymentSum: overpaymentSum,
      totalSum: totalSum,
    );
  }
}
