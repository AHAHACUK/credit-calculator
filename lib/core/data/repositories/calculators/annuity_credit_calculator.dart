import 'dart:math';

import 'package:bank_thing/core/domain/entities/credit_calculation_input.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation_result.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculator.dart';

class AnnuityCreditCalculator implements CreditCalculationCalcualtor {
  AnnuityCreditCalculator();

  @override
  CreditCalculationResult calculate(CreditCalculationInput input) {
    final annuityCoefficient = _calculateAnnuityCoefficient(
      monthsCoefficient: input.monthCoefficient,
      monthsAmount: input.monthAmount,
    );
    final monthyPaymentSum = annuityCoefficient * input.creditSum;
    final totalSum = monthyPaymentSum * input.monthAmount;
    final overpaymentSum = totalSum - input.creditSum;
    return CreditCalculationResult(
      creditSum: input.creditSum,
      monthyPaymentSum: monthyPaymentSum,
      overpaymentSum: overpaymentSum,
      totalSum: totalSum,
    );
  }

  // K = i * (1 + i)^n / ((1 + i)^n - 1)
  // K - коэффициент аннуитета
  // i - месячная процентная ставка
  // n — количество месяцев, в течение которых выплачивается кредит
  double _calculateAnnuityCoefficient({
    required double monthsCoefficient,
    required double monthsAmount,
  }) {
    final n = monthsAmount;
    final i = monthsCoefficient;
    final left = i * pow(1 + i, n);
    final right = pow(1 + i, n) - 1;
    if (right == 0) {
      return 1 / n;
    }
    final k = left / right;
    return k;
  }
}
