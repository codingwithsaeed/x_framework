import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';

class XCenterText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  const XCenterText({
    super.key,
    required this.text,
    this.style,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: style ??
            context.titleMedium.copyWith(
              color: color ?? context.scheme.onPrimaryContainer.withAlpha(180),
            ),
      ),
    );
  }
}
