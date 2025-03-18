import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';

class XCard extends StatelessWidget {
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? padding;
  final VoidCallback? onTap;
  final Widget child;
  final EdgeInsetsGeometry? margin;
  final bool isGradient;
  const XCard({
    super.key,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.onTap,
    this.margin,
    this.isGradient = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
            gradient: !isGradient
                ? null
                : LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withAlpha(230) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withAlpha(204) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withAlpha(180) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withAlpha(153) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withAlpha(102) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withAlpha(77) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withAlpha(51) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withAlpha(26) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withAlpha(23) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withAlpha(18) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withAlpha(13) ?? Theme.of(context).scaffoldBackgroundColor,
                    ],
                  ),
            color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(borderRadius ?? XDimens.padding),
            border: Border.all(color: borderColor ?? context.scheme.outline)),
        child: Padding(
          padding: EdgeInsets.all(padding ?? 0),
          child: Center(child: child),
        ),
      ),
    );
  }
}
