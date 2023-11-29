import 'package:bank_thing/core/data/repositories/annuity_credit_calculation_repository.dart';
import 'package:bank_thing/core/data/repositories/differentiated_credit_calculation_repository.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation_repository.dart';
import 'package:bank_thing/core/ui/entities/validation_error.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'credit_calculation_page_controller.g.dart';

class CreditCalculationPageController = _CreditCalculationControllerBase
    with _$CreditCalculationPageController;

abstract class _CreditCalculationControllerBase with Store {
  final Map<bool, CreditCalculationRepository> _repositories = {
    true: AnnuityCreditCalculationRepository(),
    false: DifferentiatedCreditCalculationRepository(),
  };

  @observable
  bool calculationMethodSwitch = true;

  @observable
  TextEditingController creditSumController;

  @observable
  ValidationError? creditSumError;

  @observable
  TextEditingController yearsAmountController;

  @observable
  ValidationError? yearsAmountError;

  @observable
  TextEditingController yearsPercentController;

  @observable
  ValidationError? yearsPercentError;

  @observable
  CreditCalculation? creditCalculation;

  @computed
  bool get canCalculateCredit =>
      creditSumError == null &&
      yearsAmountError == null &&
      yearsPercentError == null;

  @computed
  CreditCalculationRepository get calculationRepository =>
      _repositories[calculationMethodSwitch]!;

  _CreditCalculationControllerBase({
    required double initialCreditSum,
    required double initialYearsAmount,
    required double initialYearsPercent,
  })  : creditSumController = TextEditingController(
          text: initialCreditSum.toInt().toString(),
        ),
        yearsAmountController = TextEditingController(
          text: initialYearsAmount.toInt().toString(),
        ),
        yearsPercentController = TextEditingController(
          text: initialYearsPercent.toInt().toString(),
        ) {
    creditSumController.addListener(
      () => onCreditSumChange(creditSumController.text),
    );
    yearsAmountController.addListener(
      () => onYearAmountChange(yearsAmountController.text),
    );
    yearsPercentController.addListener(
      () => onYearsPercentChange(yearsPercentController.text),
    );
    creditCalculation = calculationRepository.calculate(
      creditSum: initialCreditSum,
      yearsAmount: initialYearsAmount,
      yearCoefficient: initialYearsPercent / 100,
    );
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
  void onYearAmountChange(String yearsAmountString) {
    if (yearsAmountString.isEmpty) {
      yearsAmountError = ValidationError.empty;
      return;
    }
    final yearsAmount = double.tryParse(yearsAmountString);
    if (yearsAmount == null) {
      yearsAmountError = ValidationError.format;
      return;
    }
    if (yearsAmount == 0) {
      yearsAmountError = ValidationError.zero;
      return;
    }
    yearsAmountError = null;
    _calculate();
  }

  @action
  void onYearsPercentChange(String yearsCoefficientString) {
    if (yearsCoefficientString.isEmpty) {
      yearsPercentError = ValidationError.empty;
      return;
    }
    final yearsCoefficient = double.tryParse(yearsCoefficientString);
    if (yearsCoefficient == null) {
      yearsPercentError = ValidationError.format;
      return;
    }
    yearsPercentError = null;
    _calculate();
  }

  @action
  void switchCalculationMethod() {
    calculationMethodSwitch = !calculationMethodSwitch;
    _calculate();
  }

  @action
  void _calculate() {
    final creditSum = _getCreditSum();
    final yearsAmount = _getYearsAmount();
    final yearCoefficient = _getYearCoefficient();
    if (creditSum == null || yearsAmount == null || yearCoefficient == null)
      return;
    creditCalculation = calculationRepository.calculate(
      creditSum: creditSum,
      yearsAmount: yearsAmount,
      yearCoefficient: yearCoefficient / 100,
    );
  }

  double? _getCreditSum() {
    return double.tryParse(creditSumController.text);
  }

  double? _getYearsAmount() {
    return double.tryParse(yearsAmountController.text);
  }

  double? _getYearCoefficient() {
    return double.tryParse(yearsPercentController.text);
  }
}
