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
  Computed<CreditCalculationRepository>? _$calculationRepositoryComputed;

  @override
  CreditCalculationRepository get calculationRepository =>
      (_$calculationRepositoryComputed ??=
              Computed<CreditCalculationRepository>(
                  () => super.calculationRepository,
                  name:
                      '_CreditCalculationControllerBase.calculationRepository'))
          .value;

  late final _$calculationMethodSwitchAtom = Atom(
      name: '_CreditCalculationControllerBase.calculationMethodSwitch',
      context: context);

  @override
  bool get calculationMethodSwitch {
    _$calculationMethodSwitchAtom.reportRead();
    return super.calculationMethodSwitch;
  }

  @override
  set calculationMethodSwitch(bool value) {
    _$calculationMethodSwitchAtom
        .reportWrite(value, super.calculationMethodSwitch, () {
      super.calculationMethodSwitch = value;
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

  late final _$yearsAmountControllerAtom = Atom(
      name: '_CreditCalculationControllerBase.yearsAmountController',
      context: context);

  @override
  TextEditingController get yearsAmountController {
    _$yearsAmountControllerAtom.reportRead();
    return super.yearsAmountController;
  }

  @override
  set yearsAmountController(TextEditingController value) {
    _$yearsAmountControllerAtom.reportWrite(value, super.yearsAmountController,
        () {
      super.yearsAmountController = value;
    });
  }

  late final _$yearsAmountErrorAtom = Atom(
      name: '_CreditCalculationControllerBase.yearsAmountError',
      context: context);

  @override
  ValidationError? get yearsAmountError {
    _$yearsAmountErrorAtom.reportRead();
    return super.yearsAmountError;
  }

  @override
  set yearsAmountError(ValidationError? value) {
    _$yearsAmountErrorAtom.reportWrite(value, super.yearsAmountError, () {
      super.yearsAmountError = value;
    });
  }

  late final _$yearsPercentControllerAtom = Atom(
      name: '_CreditCalculationControllerBase.yearsPercentController',
      context: context);

  @override
  TextEditingController get yearsPercentController {
    _$yearsPercentControllerAtom.reportRead();
    return super.yearsPercentController;
  }

  @override
  set yearsPercentController(TextEditingController value) {
    _$yearsPercentControllerAtom
        .reportWrite(value, super.yearsPercentController, () {
      super.yearsPercentController = value;
    });
  }

  late final _$yearsPercentErrorAtom = Atom(
      name: '_CreditCalculationControllerBase.yearsPercentError',
      context: context);

  @override
  ValidationError? get yearsPercentError {
    _$yearsPercentErrorAtom.reportRead();
    return super.yearsPercentError;
  }

  @override
  set yearsPercentError(ValidationError? value) {
    _$yearsPercentErrorAtom.reportWrite(value, super.yearsPercentError, () {
      super.yearsPercentError = value;
    });
  }

  late final _$creditCalculationAtom = Atom(
      name: '_CreditCalculationControllerBase.creditCalculation',
      context: context);

  @override
  CreditCalculation? get creditCalculation {
    _$creditCalculationAtom.reportRead();
    return super.creditCalculation;
  }

  @override
  set creditCalculation(CreditCalculation? value) {
    _$creditCalculationAtom.reportWrite(value, super.creditCalculation, () {
      super.creditCalculation = value;
    });
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
  void onYearAmountChange(String yearsAmountString) {
    final _$actionInfo =
        _$_CreditCalculationControllerBaseActionController.startAction(
            name: '_CreditCalculationControllerBase.onYearAmountChange');
    try {
      return super.onYearAmountChange(yearsAmountString);
    } finally {
      _$_CreditCalculationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void onYearsPercentChange(String yearsCoefficientString) {
    final _$actionInfo =
        _$_CreditCalculationControllerBaseActionController.startAction(
            name: '_CreditCalculationControllerBase.onYearsPercentChange');
    try {
      return super.onYearsPercentChange(yearsCoefficientString);
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
calculationMethodSwitch: ${calculationMethodSwitch},
creditSumController: ${creditSumController},
creditSumError: ${creditSumError},
yearsAmountController: ${yearsAmountController},
yearsAmountError: ${yearsAmountError},
yearsPercentController: ${yearsPercentController},
yearsPercentError: ${yearsPercentError},
creditCalculation: ${creditCalculation},
canCalculateCredit: ${canCalculateCredit},
calculationRepository: ${calculationRepository}
    ''';
  }
}
