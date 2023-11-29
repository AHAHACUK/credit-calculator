import 'dart:math';

import 'package:bank_thing/core/domain/entities/credit_calculation.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation_repository.dart';

class AnnuityCreditCalculationRepository
    implements CreditCalculationRepository {
  AnnuityCreditCalculationRepository();

  @override
  CreditCalculation calculate({
    required double creditSum,
    required double yearsAmount,
    required double yearCoefficient,
  }) {
    final annuityCoefficient = _calculateAnnuityCoefficient(
      yearCoefficient: yearCoefficient,
      yearsAmount: yearsAmount,
    );
    final monthyPaymentSum = annuityCoefficient * creditSum;
    final totalSum = monthyPaymentSum * 12 * yearsAmount;
    final overpaymentSum = totalSum - creditSum;
    return CreditCalculation(
      creditSum: creditSum,
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
    required double yearCoefficient,
    required double yearsAmount,
  }) {
    final n = yearsAmount * 12;
    final i = yearCoefficient / 12;
    final left = i * pow(1 + i, n);
    final right = pow(1 + i, n) - 1;
    if (right == 0) {
      return 1 / n;
    }
    final k = left / right;
    return k;
  }
}
