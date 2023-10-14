import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_framework/x_framework.dart';

class XButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? borderColor;
  final Color? disabledColor;
  final Color? highlightColor;
  final Color? splashColor;
  final bool isLoading;
  final double? radius;
  final double? minWidth;
  final double? height;
  final double elevation;

  const XButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.color,
    this.disabledColor,
    this.borderColor,
    this.isLoading = false,
    this.radius,
    this.minWidth,
    this.height,
    this.elevation = 0,
    this.highlightColor,
    this.splashColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      height: height,
      elevation: elevation,
      highlightColor: highlightColor,
      splashColor: splashColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      disabledColor: disabledColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: borderColor ?? context.primaryColor, width: 1),
        borderRadius: BorderRadius.circular(radius ?? XDimens.sPadding),
      ),
      onPressed: isLoading ? () {} : onPressed,
      color: color ?? context.primaryColor,
      child: isLoading
          ? SizedBox(
              width: ((height ?? 35.h) / 2.5.h),
              height: ((height ?? 35.h) / 2.5.h),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: color != context.primaryColor ? context.primaryColor : context.onPrimaryContainerColor,
              ),
            )
          : child,
    );
  }
}
