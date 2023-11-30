import 'package:bank_thing/core/data/repositories/calculators/annuity_credit_calculator.dart';
import 'package:bank_thing/core/data/repositories/calculators/differentiated_credit_calculator.dart';
import 'package:bank_thing/core/domain/entities/crecit_calculation_method.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation_input.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation_result.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation_repository.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculator.dart';
import 'package:bank_thing/core/ui/entities/validation_error.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'credit_calculation_page_controller.g.dart';

class CreditCalculationPageController = _CreditCalculationControllerBase
    with _$CreditCalculationPageController;

abstract class _CreditCalculationControllerBase with Store {
  final CreditCalculationRepository repository;
  final Map<CredicCalculationMethod, CreditCalculationCalcualtor> _calculators =
      {
    CredicCalculationMethod.annuity: AnnuityCreditCalculator(),
    CredicCalculationMethod.differentiated: DifferentiatedCreditCalculator(),
  };

  @observable
  CredicCalculationMethod calculationMethod = CredicCalculationMethod.annuity;

  @observable
  TextEditingController creditSumController;

  @observable
  ValidationError? creditSumError;

  @observable
  TextEditingController monthsAmountController;

  @observable
  ValidationError? monthsAmountError;

  @observable
  TextEditingController monthsPercentController;

  @observable
  ValidationError? monthsPercentError;

  @observable
  CreditCalculationInput? creditCalculationInput;

  @observable
  CreditCalculationResult? creditCalculationResult;

  @observable
  bool isSaving = false;

  @computed
  bool get canCalculateCredit =>
      creditSumError == null &&
      monthsAmountError == null &&
      monthsPercentError == null;

  @computed
  CreditCalculationCalcualtor get currentCalculator =>
      _calculators[calculationMethod]!;

  _CreditCalculationControllerBase({
    required double initialCreditSum,
    required double initialMonthAmount,
    required double initialMonthsPercent,
    required this.repository,
  })  : creditSumController = TextEditingController(
          text: initialCreditSum.toInt().toString(),
        ),
        monthsAmountController = TextEditingController(
          text: initialMonthAmount.toInt().toString(),
        ),
        monthsPercentController = TextEditingController(
          text: initialMonthsPercent.toInt().toString(),
        ) {
    creditSumController.addListener(
      () => onCreditSumChange(creditSumController.text),
    );
    monthsAmountController.addListener(
      () => onMonthAmountChange(monthsAmountController.text),
    );
    monthsPercentController.addListener(
      () => onMonthsPercentChange(monthsPercentController.text),
    );
    creditCalculationInput = CreditCalculationInput(
      creditSum: initialCreditSum,
      monthAmount: initialMonthAmount,
      monthCoefficient: initialMonthsPercent / 100,
      credicCalculationMethod: calculationMethod,
    );
    creditCalculationResult =
        currentCalculator.calculate(creditCalculationInput!);
  }

  @action
  Future<void> saveCreditCalculations() async {
    if (creditCalculationInput == null || creditCalculationResult == null)
      return;
    isSaving = true;
    await repository.saveCreditCalculations(
      CreditCalculation(
        input: creditCalculationInput!,
        result: creditCalculationResult!,
        createdTime: DateTime.now(),
      ),
    );
    isSaving = false;
  }

  @action
  Future setCreditCalculations(CreditCalculation credicCalculation) async {
    creditCalculationInput = credicCalculation.input;
    creditCalculationResult = credicCalculation.result;
    calculationMethod = credicCalculation.input.credicCalculationMethod;
    creditSumController.text = credicCalculation.input.creditSum.toString();
    monthsAmountController.text =
        credicCalculation.input.monthAmount.toString();
    monthsPercentController.text =
        (credicCalculation.input.monthCoefficient * 100).toString();
  }

  @action
  void onCreditSumChange(String creditSumString) {
    if (creditSumString.isEmpty) {
      creditSumError = ValidationError.empty;
      return;
    }
    final creditSum = double.tryParse(creditSumString);
    if (creditSum == null) {
      creditSumError = ValidationError.format;
      return;
    }
    creditSumError = null;
    _calculate();
  }

  @action
  void onMonthAmountChange(String monthsAmountString) {
    if (monthsAmountString.isEmpty) {
      monthsAmountError = ValidationError.empty;
      return;
    }
    final monthsAmount = double.tryParse(monthsAmountString);
    if (monthsAmount == null) {
      monthsAmountError = ValidationError.format;
      return;
    }
    if (monthsAmount == 0) {
      monthsAmountError = ValidationError.zero;
      return;
    }
    monthsAmountError = null;
    _calculate();
  }

  @action
  void onMonthsPercentChange(String monthsCoefficientString) {
    if (monthsCoefficientString.isEmpty) {
      monthsPercentError = ValidationError.empty;
      return;
    }
    final monthsCoefficient = double.tryParse(monthsCoefficientString);
    if (monthsCoefficient == null) {
      monthsPercentError = ValidationError.format;
      return;
    }
    monthsPercentError = null;
    _calculate();
  }

  @action
  void switchCalculationMethod() {
    if (calculationMethod == CredicCalculationMethod.annuity) {
      calculationMethod = CredicCalculationMethod.differentiated;
    } else {
      calculationMethod = CredicCalculationMethod.annuity;
    }
    _calculate();
  }

  @action
  void _calculate() {
    final creditSum = _getCreditSum();
    final monthAmouint = _getMonthAmount();
    final monthCoefficient = _getMonthCoefficient();
    if (creditSum == null || monthAmouint == null || monthCoefficient == null)
      return;
    creditCalculationInput = CreditCalculationInput(
      creditSum: creditSum,
      monthAmount: monthAmouint,
      monthCoefficient: monthCoefficient,
      credicCalculationMethod: calculationMethod,
    );
    creditCalculationResult = currentCalculator.calculate(
      creditCalculationInput!,
    );
  }

  double? _getCreditSum() {
    return double.tryParse(creditSumController.text);
  }

  double? _getMonthAmount() {
    return double.tryParse(monthsAmountController.text);
  }

  double? _getMonthCoefficient() {
    final percent = double.tryParse(monthsPercentController.text);
    if (percent == null) return null;
    return percent / 100;
  }
}
