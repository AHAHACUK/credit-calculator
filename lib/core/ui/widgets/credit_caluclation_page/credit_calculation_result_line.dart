import 'package:bank_thing/core/ui/values/core_text_styles.dart';
import 'package:flutter/material.dart';

class CreditCalculationResultLine extends StatelessWidget {
  final String label;
  final String value;
  const CreditCalculationResultLine({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$label:",
          style: CoreTextStyles.creditCalculationResultLabel,
        ),
        Text(
          value,
          style: CoreTextStyles.creditCalculationResultValue,
        ),
      ],
    );
  }
}
