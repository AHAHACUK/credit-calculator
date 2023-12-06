import 'package:bank_thing/app_localizations.dart';
import 'package:bank_thing/core/domain/entities/credit_calculation.dart';
import 'package:bank_thing/core/ui/bottom_sheets/credit_calculation_choose/credit_calculation_choose_item_line.dart';
import 'package:bank_thing/core/ui/values/core_colors.dart';
import 'package:bank_thing/core/ui/values/core_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class CreditCalculationChooseItem extends HookWidget {
  final CreditCalculation creditCalculation;
  final Function() onTap;

  const CreditCalculationChooseItem({
    super.key,
    required this.creditCalculation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);
    final dateFormatter = DateFormat(
      'dd MMMM, HH:mm',
      Localizations.localeOf(context).languageCode,
    );
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: CoreColors.creditCalculationChooseItemBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CreditCalculationChooseItemLine(
              label: localization.creditSum,
              value: creditCalculation.result.creditSum,
            ),
            CreditCalculationChooseItemLine(
              label: localization.monthlyPayment,
              value: creditCalculation.result.monthlyPaymentSum,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CreditCalculationChooseItemLine(
                  label: localization.overpayment,
                  value: creditCalculation.result.overpaymentSum,
                ),
                Text(
                  dateFormatter.format(creditCalculation.createdTime),
                  style: CoreTextStyles.creditCalculationChooseItemTime,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
