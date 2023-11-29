import 'package:bank_thing/app_localizations.dart';
import 'package:bank_thing/core/ui/mappers/validation_error_string_mapper.dart';
import 'package:bank_thing/core/ui/state_managment/credit_calculation_page_controller.dart';
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
import 'package:intl/intl.dart';

class CreditCalculationPage extends HookWidget {
  const CreditCalculationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = useMemoized(
      () => CreditCalculationPageController(
        initialCreditSum: 10000,
        initialYearsAmount: 10,
        initialYearsPercent: 10,
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
                  leftValue: pageController.creditCalculation?.creditSum ?? 1,
                  rightValue:
                      pageController.creditCalculation?.overpaymentSum ?? 1,
                  leftColor: CoreColors.ratioBarCreditColor,
                  rightColor: CoreColors.ratioBarOverpaymentColor,
                  height: 16,
                );
              }),
              const SizedBox(
                height: 16,
              ),
              if (pageController.creditCalculation == null)
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
                          pageController.creditCalculation!.creditSum,
                        ),
                      ),
                      CreditCalculationResultLine(
                        label: AppLocalizations.of(context).monthyPayment,
                        value: numbersFormatter.format(
                          pageController.creditCalculation!.monthyPaymentSum,
                        ),
                      ),
                      CreditCalculationResultLine(
                        label: AppLocalizations.of(context).creditOverpayment,
                        value: numbersFormatter.format(
                          pageController.creditCalculation!.overpaymentSum,
                        ),
                      ),
                      CreditCalculationResultLine(
                        label: AppLocalizations.of(context).totalPayment,
                        value: numbersFormatter.format(
                          pageController.creditCalculation!.totalSum,
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
                      enabled: pageController.calculationMethodSwitch,
                      enabledColor:
                          CoreColors.creditCalulationMethodSwitcherBackground,
                      disabledColor:
                          CoreColors.creditCalulationMethodSwitcherBackground,
                      handleColor:
                          CoreColors.creditCalulationMethodSwitcherHandle,
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
                  controller: pageController.yearsAmountController,
                  keyboardType: TextInputType.number,
                  error: validationErrorMapper
                      .call(pageController.yearsAmountError),
                );
              }),
              Observer(builder: (_) {
                return CreditCalculationPageField(
                  header: AppLocalizations.of(context).creditPercentage,
                  controller: pageController.yearsPercentController,
                  keyboardType: TextInputType.number,
                  error: validationErrorMapper
                      .call(pageController.yearsPercentError),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
