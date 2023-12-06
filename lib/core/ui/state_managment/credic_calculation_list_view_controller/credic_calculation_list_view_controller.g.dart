// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credic_calculation_list_view_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreditCalculationListViewController
    on _CreditCalculationListViewControllerBase, Store {
  late final _$isLoadingAtom = Atom(
      name: '_CreditCalculationListViewControllerBase.isLoading',
      context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadAsyncAction = AsyncAction(
      '_CreditCalculationListViewControllerBase.load',
      context: context);

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$deleteCalculationAsyncAction = AsyncAction(
      '_CreditCalculationListViewControllerBase.deleteCalculation',
      context: context);

  @override
  Future<void> deleteCalculation(CreditCalculation creditCalculation) {
    return _$deleteCalculationAsyncAction
        .run(() => super.deleteCalculation(creditCalculation));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading}
    ''';
  }
}
