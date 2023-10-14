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
  final double radius;
  final double width;
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
    this.width = double.infinity,
    this.radius = XDimens.sPadding,
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
    return MaterialButton(
      minWidth: width,
      height: height ?? 35.h,
      elevation: elevation,
      disabledColor: disableColor ?? context.primaryColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
        borderRadius: BorderRadius.circular(radius),
      ),
      onPressed: isLoading ? null : onTap,
      color: color ?? context.primaryColor,
      child: isLoading
          ? SizedBox(
              width: (height ?? 35.h) / 2.5.h,
              height: (height ?? 35.h) / 2.5.h,
              child: XLoading(
                thickness: 1.5.h,
                color: loadingColor ?? onButtonColor,
              ),
            )
          : XText(
              text,
              style: textStyle?.copyWith(color: textColor ?? onButtonColor, fontSize: textSize),
              color: textColor ?? onButtonColor,
              size: textSize,
              align: TextAlign.center,
            ),
    );
  }
}
