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
    Key? key,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.onTap,
    this.margin,
    this.isGradient = false,
    required this.child,
  }) : super(key: key);

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
                      backgroundColor?.withOpacity(1) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withOpacity(0.9) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withOpacity(0.8) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withOpacity(0.7) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withOpacity(0.6) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withOpacity(0.4) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withOpacity(0.3) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withOpacity(0.2) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withOpacity(0.1) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withOpacity(0.09) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withOpacity(0.07) ?? Theme.of(context).scaffoldBackgroundColor,
                      backgroundColor?.withOpacity(0.05) ?? Theme.of(context).scaffoldBackgroundColor,
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
