import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';

class XDivider extends StatelessWidget {
  final double? indent;
  final double? thinkness;
  final Color? color;
  const XDivider({
    super.key,
    this.indent = XDimens.xlPadding,
    this.color,
    this.thinkness,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent,
      endIndent: indent,
      color: color ?? context.scheme.outline.withAlpha(180),
      thickness: thinkness,
    );
  }
}
