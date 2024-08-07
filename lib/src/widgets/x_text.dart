import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';

class XText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final double? size;
  final EdgeInsetsGeometry margin;
  final TextDirection? direction;
  final TextAlign? align;
  final int? maxLines;
  final VoidCallback? onTap;
  const XText(
    this.text, {
    super.key,
    this.style,
    this.color,
    this.size,
    this.align,
    this.direction,
    this.maxLines,
    this.onTap,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          textAlign: align ?? TextAlign.right,
          textDirection: direction,
          maxLines: maxLines ?? 1,
          overflow: TextOverflow.ellipsis,
          style: style?.copyWith(color: color ?? context.scheme.onPrimaryContainer, fontSize: size) ??
              context.bodyMedium.copyWith(
                color: color ?? context.scheme.onPrimaryContainer,
                fontSize: size,
              ),
        ),
      ),
    );
  }
}
