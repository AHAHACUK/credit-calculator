import 'package:flutter/material.dart';

class Switcher extends StatelessWidget {
  final double? width;
  final double? height;
  final Color enabledColor;
  final Color disabledColor;
  final Color handleColor;
  final bool enabled;
  final Function(bool enabled) onSwitch;

  const Switcher({
    super.key,
    required this.enabled,
    this.width = 48,
    this.height = 24,
    required this.enabledColor,
    required this.disabledColor,
    required this.handleColor,
    required this.onSwitch,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onSwitch(!enabled),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          color: enabled ? enabledColor : disabledColor,
        ),
        child: Align(
          alignment: enabled ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            height: height,
            width: height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: handleColor,
            ),
          ),
        ),
      ),
    );
  }
}
