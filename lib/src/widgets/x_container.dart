import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';

class XContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final double? elevation;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final VoidCallback? onTap;
  const XContainer({
    super.key,
    required this.child,
    this.color,
    this.elevation,
    this.borderColor,
    this.margin,
    this.padding,
    this.onTap,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color ?? context.scheme.surface,
        margin: margin ?? EdgeInsets.zero,
        shadowColor: context.scheme.primary,
        surfaceTintColor: color ?? context.scheme.surface,
        elevation: elevation ?? 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor ?? context.scheme.outline),
          borderRadius: borderRadius ?? BorderRadius.zero,
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}
