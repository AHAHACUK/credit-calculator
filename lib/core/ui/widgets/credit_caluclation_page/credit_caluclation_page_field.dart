import 'package:bank_thing/core/ui/presets/core_text_field_presets.dart';
import 'package:bank_thing/core/ui/values/core_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreditCalculationPageField extends StatelessWidget {
  final String header;
  final TextEditingController? controller;
  final String? error;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CreditCalculationPageField({
    super.key,
    required this.header,
    this.controller,
    this.inputFormatters,
    this.keyboardType,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          header,
          style: CoreTextStyles.textFieldHeader,
        ),
        CoreTextFieldPresets.main(
          controller: controller,
          error: error,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
