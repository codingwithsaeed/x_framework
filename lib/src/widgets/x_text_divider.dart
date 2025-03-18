import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';

class XTextDivider extends StatelessWidget {
  final String text;
  final Color? color;

  const XTextDivider({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const XDivider().expand(),
        XText(
          text,
          style: context.titleMedium,
          color: context.scheme.onSurface.withAlpha(128),
        ),
        const XDivider().expand(),
      ],
    );
  }
}
