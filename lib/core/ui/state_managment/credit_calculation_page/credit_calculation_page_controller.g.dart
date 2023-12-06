// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_calculation_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreditCalculationPageController
    on _CreditCalculationControllerBase, Store {
  Computed<bool>? _$canCalculateCreditComputed;

  @override
  bool get canCalculateCredit => (_$canCalculateCreditComputed ??=
          Computed<bool>(() => super.canCalculateCredit,
              name: '_CreditCalculationControllerBase.canCalculateCredit'))
      .value;
  Computed<CreditCalculationCalculator>? _$currentCalculatorComputed;

  @override
  CreditCalculationCalculator get currentCalculator =>
      (_$currentCalculatorComputed ??= Computed<CreditCalculationCalculator>(
              () => super.currentCalculator,
              name: '_CreditCalculationControllerBase.currentCalculator'))
          .value;

  late final _$calculationMethodAtom = Atom(
      name: '_CreditCalculationControllerBase.calculationMethod',
      context: context);

  @override
  CreditCalculationMethod get calculationMethod {
    _$calculationMethodAtom.reportRead();
    return super.calculationMethod;
  }

  @override
  set calculationMethod(CreditCalculationMethod value) {
    _$calculationMethodAtom.reportWrite(value, super.calculationMethod, () {
      super.calculationMethod = value;
    });
  }

  late final _$creditSumControllerAtom = Atom(
      name: '_CreditCalculationControllerBase.creditSumController',
      context: context);

  @override
  TextEditingController get creditSumController {
    _$creditSumControllerAtom.reportRead();
    return super.creditSumController;
  }

  @override
  set creditSumController(TextEditingController value) {
    _$creditSumControllerAtom.reportWrite(value, super.creditSumController, () {
      super.creditSumController = value;
    });
  }

  late final _$creditSumErrorAtom = Atom(
      name: '_CreditCalculationControllerBase.creditSumError',
      context: context);

  @override
  ValidationError? get creditSumError {
    _$creditSumErrorAtom.reportRead();
    return super.creditSumError;
  }

  @override
  set creditSumError(ValidationError? value) {
    _$creditSumErrorAtom.reportWrite(value, super.creditSumError, () {
      super.creditSumError = value;
    });
  }

  late final _$monthsAmountControllerAtom = Atom(
      name: '_CreditCalculationControllerBase.monthsAmountController',
      context: context);

  @override
  TextEditingController get monthsAmountController {
    _$monthsAmountControllerAtom.reportRead();
    return super.monthsAmountController;
  }

  @override
  set monthsAmountController(TextEditingController value) {
    _$monthsAmountControllerAtom
        .reportWrite(value, super.monthsAmountController, () {
      super.monthsAmountController = value;
    });
  }

  late final _$monthsAmountErrorAtom = Atom(
      name: '_CreditCalculationControllerBase.monthsAmountError',
      context: context);

  @override
  ValidationError? get monthsAmountError {
    _$monthsAmountErrorAtom.reportRead();
    return super.monthsAmountError;
  }

  @override
  set monthsAmountError(ValidationError? value) {
    _$monthsAmountErrorAtom.reportWrite(value, super.monthsAmountError, () {
      super.monthsAmountError = value;
    });
  }

  late final _$monthsPercentControllerAtom = Atom(
      name: '_CreditCalculationControllerBase.monthsPercentController',
      context: context);

  @override
  TextEditingController get monthsPercentController {
    _$monthsPercentControllerAtom.reportRead();
    return super.monthsPercentController;
  }

  @override
  set monthsPercentController(TextEditingController value) {
    _$monthsPercentControllerAtom
        .reportWrite(value, super.monthsPercentController, () {
      super.monthsPercentController = value;
    });
  }

  late final _$monthsPercentErrorAtom = Atom(
      name: '_CreditCalculationControllerBase.monthsPercentError',
      context: context);

  @override
  ValidationError? get monthsPercentError {
    _$monthsPercentErrorAtom.reportRead();
    return super.monthsPercentError;
  }

  @override
  set monthsPercentError(ValidationError? value) {
    _$monthsPercentErrorAtom.reportWrite(value, super.monthsPercentError, () {
      super.monthsPercentError = value;
    });
  }

  late final _$creditCalculationInputAtom = Atom(
      name: '_CreditCalculationControllerBase.creditCalculationInput',
      context: context);

  @override
  CreditCalculationInput? get creditCalculationInput {
    _$creditCalculationInputAtom.reportRead();
    return super.creditCalculationInput;
  }

  @override
  set creditCalculationInput(CreditCalculationInput? value) {
    _$creditCalculationInputAtom
        .reportWrite(value, super.creditCalculationInput, () {
      super.creditCalculationInput = value;
    });
  }

  late final _$creditCalculationResultAtom = Atom(
      name: '_CreditCalculationControllerBase.creditCalculationResult',
      context: context);

  @override
  CreditCalculationResult? get creditCalculationResult {
    _$creditCalculationResultAtom.reportRead();
    return super.creditCalculationResult;
  }

  @override
  set creditCalculationResult(CreditCalculationResult? value) {
    _$creditCalculationResultAtom
        .reportWrite(value, super.creditCalculationResult, () {
      super.creditCalculationResult = value;
    });
  }

  late final _$isSavingAtom =
      Atom(name: '_CreditCalculationControllerBase.isSaving', context: context);

  @override
  bool get isSaving {
    _$isSavingAtom.reportRead();
    return super.isSaving;
  }

  @override
  set isSaving(bool value) {
    _$isSavingAtom.reportWrite(value, super.isSaving, () {
      super.isSaving = value;
    });
  }

  late final _$saveCreditCalculationsAsyncAction = AsyncAction(
      '_CreditCalculationControllerBase.saveCreditCalculations',
      context: context);

  @override
  Future<void> saveCreditCalculations() {
    return _$saveCreditCalculationsAsyncAction
        .run(() => super.saveCreditCalculations());
  }

  late final _$setCreditCalculationsAsyncAction = AsyncAction(
      '_CreditCalculationControllerBase.setCreditCalculations',
      context: context);

  @override
  Future<dynamic> setCreditCalculations(CreditCalculation creditCalculation) {
    return _$setCreditCalculationsAsyncAction
        .run(() => super.setCreditCalculations(creditCalculation));
  }

  late final _$_CreditCalculationControllerBaseActionController =
      ActionController(
          name: '_CreditCalculationControllerBase', context: context);

  @override
  void onCreditSumChange(String creditSumString) {
    final _$actionInfo =
        _$_CreditCalculationControllerBaseActionController.startAction(
            name: '_CreditCalculationControllerBase.onCreditSumChange');
    try {
      return super.onCreditSumChange(creditSumString);
    } finally {
      _$_CreditCalculationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void onMonthAmountChange(String monthsAmountString) {
    final _$actionInfo =
        _$_CreditCalculationControllerBaseActionController.startAction(
            name: '_CreditCalculationControllerBase.onMonthAmountChange');
    try {
      return super.onMonthAmountChange(monthsAmountString);
    } finally {
      _$_CreditCalculationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void onMonthsPercentChange(String monthsCoefficientString) {
    final _$actionInfo =
        _$_CreditCalculationControllerBaseActionController.startAction(
            name: '_CreditCalculationControllerBase.onMonthsPercentChange');
    try {
      return super.onMonthsPercentChange(monthsCoefficientString);
    } finally {
      _$_CreditCalculationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void switchCalculationMethod() {
    final _$actionInfo =
        _$_CreditCalculationControllerBaseActionController.startAction(
            name: '_CreditCalculationControllerBase.switchCalculationMethod');
    try {
      return super.switchCalculationMethod();
    } finally {
      _$_CreditCalculationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void _calculate() {
    final _$actionInfo = _$_CreditCalculationControllerBaseActionController
        .startAction(name: '_CreditCalculationControllerBase._calculate');
    try {
      return super._calculate();
    } finally {
      _$_CreditCalculationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
calculationMethod: ${calculationMethod},
creditSumController: ${creditSumController},
creditSumError: ${creditSumError},
monthsAmountController: ${monthsAmountController},
monthsAmountError: ${monthsAmountError},
monthsPercentController: ${monthsPercentController},
monthsPercentError: ${monthsPercentError},
creditCalculationInput: ${creditCalculationInput},
creditCalculationResult: ${creditCalculationResult},
isSaving: ${isSaving},
canCalculateCredit: ${canCalculateCredit},
currentCalculator: ${currentCalculator}
    ''';
  }
}
