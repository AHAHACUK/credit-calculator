import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextStyle? inactiveTextStyle;
  final Color? loadingIndicatorColor;
  final Function() onTap;
  final Color backgroundColor;
  final Color? inactiveBackgroundColor;
  final Color? loadingBackgroundColor;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final bool active;
  final bool loading;

  const Button({
    super.key,
    required this.text,
    required this.textStyle,
    this.inactiveTextStyle,
    this.loadingIndicatorColor,
    required this.onTap,
    required this.backgroundColor,
    this.inactiveBackgroundColor,
    this.loadingBackgroundColor,
    this.width,
    this.height,
    this.padding,
    this.active = true,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveBackgroundColor;
    if (loading) {
      effectiveBackgroundColor = loadingBackgroundColor ?? backgroundColor;
    } else if (!active) {
      effectiveBackgroundColor = inactiveBackgroundColor ?? backgroundColor;
    } else {
      effectiveBackgroundColor = backgroundColor;
    }
    return GestureDetector(
      onTap: () {
        if (!active) return;
        onTap.call();
      },
      child: Container(
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: effectiveBackgroundColor,
        ),
        child: Builder(builder: (context) {
          if (loading) {
            return Center(
              child: CircularProgressIndicator(
                color: loadingIndicatorColor,
              ),
            );
          }
          return Center(
            child: Text(
              text,
              style: active ? textStyle : inactiveTextStyle ?? textStyle,
            ),
          );
        }),
      ),
    );
  }
}
