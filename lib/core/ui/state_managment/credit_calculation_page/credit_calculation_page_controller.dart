import 'package:bank_thing/core/data/repositories/calculators/annuity_credit_calculator.dart';
import 'package:bank_thing/core/data/repositories/calculators/differentiated_credit_calculator.dart';
import 'package:bank_thing/core/domain/entities/crecit_calculation_method.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation_input.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation_result.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation/credit_calculation_repository.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation/save_credit_calculation_dto.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculator.dart';
import 'package:bank_thing/core/ui/entities/validation_error.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'credit_calculation_page_controller.g.dart';

class CreditCalculationPageController = _CreditCalculationControllerBase
    with _$CreditCalculationPageController;

abstract class _CreditCalculationControllerBase with Store {
  final CreditCalculationRepository repository;
  final Map<CreditCalculationMethod, CreditCalculationCalculator> _calculators =
      {
    CreditCalculationMethod.annuity: AnnuityCreditCalculator(),
    CreditCalculationMethod.differentiated: DifferentiatedCreditCalculator(),
  };

  @observable
  CreditCalculationMethod calculationMethod = CreditCalculationMethod.annuity;

  @observable
  TextEditingController creditSumController;

  @observable
  ValidationError? creditSumError;

  @observable
  TextEditingController monthsAmountController;

  @observable
  ValidationError? monthsAmountError;

  static const _monthAmountMaximum = 1000;

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
  CreditCalculationCalculator get currentCalculator =>
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
      creditCalculationMethod: calculationMethod,
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
      SaveCreditCalculationDto(
        input: creditCalculationInput!,
        result: creditCalculationResult!,
      ),
    );
    isSaving = false;
  }

  @action
  Future setCreditCalculations(CreditCalculation creditCalculation) async {
    creditCalculationInput = creditCalculation.input;
    creditCalculationResult = creditCalculation.result;
    calculationMethod = creditCalculation.input.creditCalculationMethod;
    creditSumController.text = creditCalculation.input.creditSum.toString();
    monthsAmountController.text =
        creditCalculation.input.monthAmount.toString();
    monthsPercentController.text =
        (creditCalculation.input.monthCoefficient * 100).toString();
  }

  @action
  void onCreditSumChange(String creditSumString) {
    if (creditSumString.isEmpty) {
      creditSumError = EmptyValidationError();
      return;
    }
    final creditSum = double.tryParse(creditSumString);
    if (creditSum == null) {
      creditSumError = FormatValidationError();
      return;
    }
    if (creditSum == 0) {
      creditSumError = ZeroValidationError();
      return;
    }
    creditSumError = null;
    _calculate();
  }

  @action
  void onMonthAmountChange(String monthsAmountString) {
    if (monthsAmountString.isEmpty) {
      monthsAmountError = EmptyValidationError();
      return;
    }
    final monthsAmount = double.tryParse(monthsAmountString);
    if (monthsAmount == null) {
      monthsAmountError = FormatValidationError();
      return;
    }
    if (monthsAmount == 0) {
      monthsAmountError = ZeroValidationError();
      return;
    }
    if (monthsAmount > _monthAmountMaximum) {
      monthsAmountError = TooLargeValidationError(
        _monthAmountMaximum.toInt().toString(),
      );
      return;
    }
    monthsAmountError = null;
    _calculate();
  }

  @action
  void onMonthsPercentChange(String monthsCoefficientString) {
    if (monthsCoefficientString.isEmpty) {
      monthsPercentError = EmptyValidationError();
      return;
    }
    final monthsCoefficient = double.tryParse(monthsCoefficientString);
    if (monthsCoefficient == null) {
      monthsPercentError = FormatValidationError();
      return;
    }
    monthsPercentError = null;
    _calculate();
  }

  @action
  void switchCalculationMethod() {
    if (calculationMethod == CreditCalculationMethod.annuity) {
      calculationMethod = CreditCalculationMethod.differentiated;
    } else {
      calculationMethod = CreditCalculationMethod.annuity;
    }
    _calculate();
  }

  @action
  void _calculate() {
    final creditSum = _getCreditSum();
    final monthAmount = _getMonthAmount();
    final monthCoefficient = _getMonthCoefficient();
    if (creditSum == null || monthAmount == null || monthCoefficient == null)
      return;
    creditCalculationInput = CreditCalculationInput(
      creditSum: creditSum,
      monthAmount: monthAmount,
      monthCoefficient: monthCoefficient,
      creditCalculationMethod: calculationMethod,
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
