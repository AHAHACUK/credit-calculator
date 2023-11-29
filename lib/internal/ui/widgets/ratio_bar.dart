import 'package:flutter/material.dart';

class RatioBar extends StatelessWidget {
  final double leftValue;
  final double rightValue;
  final Color leftColor;
  final Color rightColor;
  final double height;

  const RatioBar({
    super.key,
    required this.leftValue,
    required this.rightValue,
    required this.leftColor,
    required this.rightColor,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final leftRation = leftValue / (leftValue + rightValue) * 100;
    final leftFlex = leftRation.toInt();
    return SizedBox(
      height: height,
      child: Row(
        children: [
          Expanded(
            flex: leftFlex,
            child: Container(
              decoration: BoxDecoration(
                color: leftColor,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(16),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 100 - leftFlex,
            child: Container(
              decoration: BoxDecoration(
                color: rightColor,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
