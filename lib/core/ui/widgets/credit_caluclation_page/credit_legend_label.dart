import 'package:bank_thing/core/ui/values/core_text_styles.dart';
import 'package:flutter/material.dart';

class CreditLegendLabel extends StatelessWidget {
  final String label;
  final Color color;

  const CreditLegendLabel({
    super.key,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: CoreTextStyles.legendLabel,
        )
      ],
    );
  }
}
