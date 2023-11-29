import 'package:bank_thing/core/ui/values/core_colors.dart';
import 'package:flutter/material.dart';

class CoreTextStyles {
  static const textFieldHeader = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: CoreColors.textFieldHeader,
  );

  static const textFieldError = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: CoreColors.textFieldError,
  );

  static const creditCalculationResultLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: CoreColors.creditCalculationResultLabel,
  );

  static const creditCalculationMethodSwitcherLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: CoreColors.creditCalculationMethodSwitcherLabel,
  );

  static const creditCalculationResultValue = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: CoreColors.creditCalculationResultValue,
  );

  static const legendLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: CoreColors.legendLabel,
  );
}
