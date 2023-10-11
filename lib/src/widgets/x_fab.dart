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
    Key? key,
    this.icon,
    this.color,
    this.onTap,
    this.iconSize,
    this.iconColor,
    this.borderColor,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color ?? context.primaryColor,
            border: Border.all(color: borderColor ?? Colors.transparent)),
        padding: contentPadding ?? const EdgeInsets.all(XDimens.sPadding),
        child: Icon(
          icon ?? Icons.add,
          color: iconColor ?? context.onPrimaryColor,
          size: iconSize ?? 36,
        ),
      ),
    );
  }
}
