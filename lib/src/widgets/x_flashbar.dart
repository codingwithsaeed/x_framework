import 'package:another_flushbar/flushbar.dart';
import 'package:x_framework/x_framework.dart';
import 'package:flutter/material.dart';

typedef XF = XFlashbar;
typedef XFType = XFlashbarType;

const _flashBarTypeColors = {
  XFType.success: Colors.green,
  XFType.error: Colors.red,
  XFType.warning: Colors.orange,
  XFType.info: Colors.blue,
};

const _flashBarTypeIcons = {
  XFType.success: Icons.check_circle_outline_rounded,
  XFType.error: Icons.error_outline_rounded,
  XFType.warning: Icons.warning_amber_rounded,
  XFType.info: Icons.info_outline_rounded,
};

enum XFlashbarType {
  success,
  error,
  warning,
  info;

  Color get color => _flashBarTypeColors[this]!;
  IconData get icon => _flashBarTypeIcons[this]!;
}

abstract class XFlashbar {
  const XFlashbar._();

  static void show({
    required BuildContext context,
    required String text,
    XFlashbarType type = XFlashbarType.info,
    Duration duration = const Duration(milliseconds: 3500),
    bool hideBorder = false,
    Color? backgroundColor,
    Color? barColor,
    Color? textColor,
  }) {
    Flushbar(
      message: text,
      icon: Icon(type.icon, size: XDimens.lPadding, color: barColor ?? type.color),
      margin: const EdgeInsets.all(XDimens.sPadding),
      flushbarStyle: FlushbarStyle.FLOATING,
      padding: const EdgeInsets.fromLTRB(XDimens.padding, XDimens.padding, 0, XDimens.padding),
      backgroundColor: backgroundColor ?? context.primaryContainerColor,
      messageColor: textColor ?? context.onBackgroundColor,
      flushbarPosition: FlushbarPosition.TOP,
      textDirection: Directionality.of(context),
      borderRadius: BorderRadius.circular(XDimens.sPadding),
      borderColor: hideBorder ? null : context.outlineColor,
      duration: duration,
      leftBarIndicatorColor: barColor ?? type.color,
    ).show(context);
  }
}
