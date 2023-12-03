import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_framework/x_framework.dart';

class XButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? color;
  final Color? borderColor;
  final Color? disabledColor;
  final Color? highlightColor;
  final Color? splashColor;
  final Color? loadingColor;
  final bool isLoading;
  final double? radius;
  final double? minWidth;
  final double? height;
  final double elevation;

  const XButton({
    Key? key,
    required this.child,
    this.onTap,
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
    this.loadingColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      height: height ?? 35.h,
      elevation: elevation,
      highlightColor: highlightColor,
      splashColor: splashColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      disabledColor: disabledColor ?? context.onSurfaceColor.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: onTap == null ? (disabledColor ?? Colors.transparent) : (borderColor ?? context.primaryColor),
            width: 1),
        borderRadius: BorderRadius.circular(radius ?? XDimens.sPadding),
      ),
      onPressed: isLoading ? null : onTap,
      color: color ?? context.primaryColor,
      child: isLoading
          ? SizedBox(
              width: ((height ?? 35.h) / 2.5.h),
              height: ((height ?? 35.h) / 2.5.h),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: loadingColor ?? (color != context.primaryColor
                    ? context.primaryColor
                    : context.onPrimaryContainerColor),
              ),
            )
          : child,
    );
  }
}
