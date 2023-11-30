import 'package:bank_thing/core/ui/values/core_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class CreditCalculationChooseItemLine extends HookWidget {
  final String label;
  final double value;

  const CreditCalculationChooseItemLine({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final numbersFormatter = useMemoized(
      () => NumberFormat(
        "#,###",
        Localizations.localeOf(context).languageCode,
      ),
    );
    return Row(
      children: [
        Text(
          "$label:",
          style: CoreTextStyles.creditCalculationChooseItemLabel,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          numbersFormatter.format(value),
          style: CoreTextStyles.creditCalculationChooseItemValue,
        ),
      ],
    );
  }
}
