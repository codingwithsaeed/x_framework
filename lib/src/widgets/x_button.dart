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
    super.key,
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
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: minWidth,
      height: height ?? 35.h,
      elevation: elevation,
      highlightColor: highlightColor,
      splashColor: splashColor,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      disabledColor: disabledColor ?? context.scheme.inverseSurface.withAlpha(77),
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: onTap == null ? (disabledColor ?? Colors.transparent) : (borderColor ?? context.scheme.primary),
            width: 1),
        borderRadius: BorderRadius.circular(radius ?? XDimens.sPadding),
      ),
      onPressed: isLoading ? null : onTap,
      color: color ?? context.scheme.primary,
      child: isLoading
          ? SizedBox(
              width: ((height ?? 35.h) / 2.5.h),
              height: ((height ?? 35.h) / 2.5.h),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: loadingColor ??
                    (color != context.scheme.primary ? context.scheme.primary : context.scheme.onPrimaryContainer),
              ),
            )
          : child,
    );
  }
}
