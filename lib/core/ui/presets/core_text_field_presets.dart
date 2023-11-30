import 'package:bank_thing/core/ui/values/core_colors.dart';
import 'package:bank_thing/core/ui/values/core_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoreTextFieldPresets {
  static Widget main({
    TextEditingController? controller,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? error,
  }) {
    final hasError = error != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: CoreColors.textFieldBackground,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            border: hasError
                ? Border.all(
                    width: 2,
                    color: CoreColors.textFieldErrorBorder,
                  )
                : null,
          ),
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isDense: true,
            ),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              error,
              style: CoreTextStyles.textFieldError,
            ),
          )
      ],
    );
  }
}
