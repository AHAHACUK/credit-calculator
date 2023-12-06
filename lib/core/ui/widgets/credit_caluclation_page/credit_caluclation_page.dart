import 'package:bank_thing/app_localizations.dart';
import 'package:bank_thing/core/domain/entities/crecit_calculation_method.dart';
import 'package:bank_thing/core/domain/repositories/credit_calculation/credit_calculation_repository.dart';
import 'package:bank_thing/core/ui/bottom_sheets/credit_calculation_choose/credit_calculation_choose_bottom_sheet.dart';
import 'package:bank_thing/core/ui/mappers/validation_error_string_mapper.dart';
import 'package:bank_thing/core/ui/presets/core_button_presets.dart';
import 'package:bank_thing/core/ui/state_managment/credit_calculation_page/credit_calculation_page_controller.dart';
import 'package:bank_thing/core/ui/values/core_colors.dart';
import 'package:bank_thing/core/ui/values/core_text_styles.dart';
import 'package:bank_thing/core/ui/widgets/credit_caluclation_page/credit_calculation_result_line.dart';
import 'package:bank_thing/core/ui/widgets/credit_caluclation_page/credit_caluclation_page_field.dart';
import 'package:bank_thing/core/ui/widgets/credit_caluclation_page/credit_legend_label.dart';
import 'package:bank_thing/internal/ui/widgets/ratio_bar.dart';
import 'package:bank_thing/internal/ui/widgets/switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class CreditCalculationPage extends HookWidget {
  const CreditCalculationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = useMemoized(
      () => GetIt.I<CreditCalculationRepository>(),
    );
    final pageController = useMemoized(
      () => CreditCalculationPageController(
        initialCreditSum: 10000,
        initialMonthAmount: 10,
        initialMonthsPercent: 10,
        repository: repository,
      ),
    );
    final validationErrorMapper = useMemoized(
      () => ValidationErrorStringMapper(AppLocalizations.of(context)),
    );
    final numbersFormatter = NumberFormat(
      "#,###",
      Localizations.localeOf(context).languageCode,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CreditLegendLabel(
                    label: AppLocalizations.of(context).credit,
                    color: CoreColors.ratioBarCreditColor,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CreditLegendLabel(
                    label: AppLocalizations.of(context).overpayment,
                    color: CoreColors.ratioBarOverpaymentColor,
                  ),
                ],
              ),
              Observer(builder: (_) {
                return RatioBar(
                  leftValue:
                      pageController.creditCalculationResult?.creditSum ?? 1,
                  rightValue:
                      pageController.creditCalculationResult?.overpaymentSum ??
                          1,
                  leftColor: CoreColors.ratioBarCreditColor,
                  rightColor: CoreColors.ratioBarOverpaymentColor,
                  height: 16,
                );
              }),
              const SizedBox(
                height: 16,
              ),
              if (pageController.creditCalculationResult == null)
                Center(
                  child: CircularProgressIndicator(),
                )
              else
                Observer(builder: (_) {
                  return Column(
                    children: [
                      CreditCalculationResultLine(
                        label: AppLocalizations.of(context).creditSum,
                        value: numbersFormatter.format(
                          pageController.creditCalculationResult!.creditSum,
                        ),
                      ),
                      CreditCalculationResultLine(
                        label: AppLocalizations.of(context).monthlyPayment,
                        value: numbersFormatter.format(
                          pageController
                              .creditCalculationResult!.monthlyPaymentSum,
                        ),
                      ),
                      CreditCalculationResultLine(
                        label: AppLocalizations.of(context).creditOverpayment,
                        value: numbersFormatter.format(
                          pageController
                              .creditCalculationResult!.overpaymentSum,
                        ),
                      ),
                      CreditCalculationResultLine(
                        label: AppLocalizations.of(context).totalPayment,
                        value: numbersFormatter.format(
                          pageController.creditCalculationResult!.totalSum,
                        ),
                      ),
                    ],
                  );
                }),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)
                          .differentiatedCreditCalculation,
                      textAlign: TextAlign.center,
                      style:
                          CoreTextStyles.creditCalculationMethodSwitcherLabel,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Observer(builder: (_) {
                    return Switcher(
                      width: 96,
                      enabled: pageController.calculationMethod ==
                          CreditCalculationMethod.annuity,
                      enabledColor:
                          CoreColors.creditCalculationMethodSwitcherBackground,
                      disabledColor:
                          CoreColors.creditCalculationMethodSwitcherBackground,
                      handleColor:
                          CoreColors.creditCalculationMethodSwitcherHandle,
                      onSwitch: (value) =>
                          pageController.switchCalculationMethod(),
                    );
                  }),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context).annuityCreditCalculation,
                      style:
                          CoreTextStyles.creditCalculationMethodSwitcherLabel,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Observer(builder: (context) {
                return CreditCalculationPageField(
                  header: AppLocalizations.of(context).creditSum,
                  controller: pageController.creditSumController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  error:
                      validationErrorMapper.call(pageController.creditSumError),
                );
              }),
              Observer(builder: (_) {
                return CreditCalculationPageField(
                  header: AppLocalizations.of(context).creditTime,
                  controller: pageController.monthsAmountController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  error: validationErrorMapper
                      .call(pageController.monthsAmountError),
                );
              }),
              Observer(builder: (_) {
                return CreditCalculationPageField(
                  header: AppLocalizations.of(context).creditPercentage,
                  controller: pageController.monthsPercentController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  error: validationErrorMapper
                      .call(pageController.monthsPercentError),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              Observer(builder: (context) {
                return Center(
                  child: CoreButtonPresets.button(
                    height: 42,
                    text: AppLocalizations.of(context).saveCalculation,
                    width: 200,
                    loading: pageController.isSaving,
                    active: pageController.creditCalculationResult != null &&
                        pageController.canCalculateCredit,
                    onTap: () async {
                      pageController.saveCreditCalculations();
                    },
                  ),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              Observer(builder: (context) {
                return Center(
                  child: CoreButtonPresets.button(
                    height: 42,
                    text: AppLocalizations.of(context).loadCalculation,
                    width: 200,
                    active: pageController.creditCalculationResult != null,
                    onTap: () async {
                      final creditCalculation =
                          await showCreditCalculationChooseBottomSheet(context);
                      if (creditCalculation == null) return;
                      pageController.setCreditCalculations(creditCalculation);
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
