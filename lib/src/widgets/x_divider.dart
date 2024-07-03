import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';

class XDivider extends StatelessWidget {
  final double? indent;
  final double? thinkness;
  final Color? color;
  const XDivider({
    Key? key,
    this.indent = XDimens.xlPadding,
    this.color,
    this.thinkness,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: indent,
      endIndent: indent,
      color: color ?? context.scheme.outline.withOpacity(0.7),
      thickness: thinkness,
    );
  }
}
