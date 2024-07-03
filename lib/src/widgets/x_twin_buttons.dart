import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';

class XTwinButtons extends StatelessWidget {
  const XTwinButtons({
    Key? key,
    this.confirmAction,
    this.cancelAction,
    this.margin,
    this.buttonsHeight,
    this.confirmText,
    this.cancelText,
    this.confirmColor,
    this.cancelColor,
    this.confirmBorderColor,
    this.confirmTextColor,
    this.cancelBorderColor,
    this.cancelTextColor,
  }) : super(key: key);
  final VoidCallback? confirmAction;
  final String? confirmText;
  final VoidCallback? cancelAction;
  final String? cancelText;
  final Color? confirmColor;
  final Color? confirmBorderColor;
  final Color? confirmTextColor;
  final Color? cancelColor;
  final Color? cancelBorderColor;
  final Color? cancelTextColor;
  final EdgeInsetsGeometry? margin;
  final double? buttonsHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: XTextButton(
              onTap: confirmAction,
              height: buttonsHeight ?? 35,
              borderColor: confirmBorderColor,
              textStyle: context.bodyLarge,
              textColor: confirmTextColor ?? context.scheme.onPrimary,
              text: confirmText ?? 'تایید',
              color: confirmColor,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: XTextButton(
              color: context.scheme.surface,
              borderColor: cancelBorderColor ?? context.scheme.primaryContainer.withOpacity(0.7),
              height: buttonsHeight ?? 35,
              onTap: cancelAction ?? () => Navigator.pop(context),
              text: cancelText ?? 'انصراف',
              textStyle: context.bodyLarge,
              textColor: cancelTextColor ?? context.scheme.primaryContainer.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
