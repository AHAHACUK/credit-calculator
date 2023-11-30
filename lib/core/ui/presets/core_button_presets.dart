import 'package:bank_thing/core/ui/values/core_colors.dart';
import 'package:bank_thing/core/ui/values/core_text_styles.dart';
import 'package:bank_thing/internal/ui/widgets/button.dart';
import 'package:flutter/material.dart';

class CoreButtonPresets {
  static Widget button({
    required String text,
    required Function() onTap,
    bool? active,
    bool? loading,
    double? width,
    double? height,
  }) {
    return Button(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      text: text,
      textStyle: CoreTextStyles.button,
      inactiveTextStyle: CoreTextStyles.inactiveButton,
      onTap: onTap,
      active: active ?? true,
      loading: loading ?? false,
      backgroundColor: CoreColors.buttonBackground,
      inactiveBackgroundColor: CoreColors.buttonBackgroundInactive,
      loadingBackgroundColor: CoreColors.buttonBackgroundLoading,
      loadingIndicatorColor: CoreColors.buttonLoadingIndicator,
      width: width,
      height: height,
    );
  }
}
