import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_framework/x_framework.dart';

class XTextButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? textSize;
  final TextStyle? textStyle;
  final Color? loadingColor;
  final VoidCallback? onTap;
  final Color? color;
  final Color? borderColor;
  final Color? disableColor;
  final bool isLoading;
  final double? radius;
  final double? minWidth;
  final double? height;
  final double elevation;

  const XTextButton({
    Key? key,
    required this.text,
    this.onTap,
    this.color,
    this.borderColor,
    this.disableColor,
    this.height,
    this.minWidth,
    this.radius,
    this.elevation = 0,
    this.isLoading = false,
    this.textColor,
    this.textSize,
    this.textStyle,
    this.loadingColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onButtonColor = color == null ? context.onPrimaryColor : context.onBackgroundColor;
    return XButton(
      minWidth: minWidth,
      height: height ?? 35.h,
      elevation: elevation,
      isLoading: isLoading,
      borderColor: borderColor,
      radius: radius,
      disabledColor: disableColor,
      loadingColor: loadingColor,
      onTap: onTap,
      color: color,
      child: XText(
        text,
        style: textStyle?.copyWith(fontSize: textSize),
        color: onTap == null ? context.onSurfaceColor : textColor ?? onButtonColor,
        size: textSize,
        align: TextAlign.center,
      ),
    );
  }
}
