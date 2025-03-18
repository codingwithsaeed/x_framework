import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';

class XFab extends StatelessWidget {
  final IconData? icon;
  final double? iconSize;
  final Color? color;
  final Color? iconColor;
  final Color? borderColor;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? contentPadding;

  const XFab({
    super.key,
    this.icon,
    this.color,
    this.onTap,
    this.iconSize,
    this.iconColor,
    this.borderColor,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color ?? context.scheme.primary,
            border: Border.all(color: borderColor ?? Colors.transparent)),
        padding: contentPadding ?? const EdgeInsets.all(XDimens.sPadding),
        child: Icon(
          icon ?? Icons.add,
          color: iconColor ?? context.scheme.onPrimary,
          size: iconSize ?? 36,
        ),
      ),
    );
  }
}
