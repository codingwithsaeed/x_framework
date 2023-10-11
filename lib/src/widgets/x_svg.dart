import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_framework/x_framework.dart';

class XSvg extends StatelessWidget {
  final String asset;
  final double? width;
  final double? height;
  final Color? color;
  final bool applyNightMode;
  const XSvg({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.color,
    this.applyNightMode = true,
  });

  @override
  Widget build(BuildContext context) {
    return applyNightMode
        ? color == null
            ? context.isLight
                ? SvgPicture.asset(
                    asset,
                    width: width,
                    height: height,
                  )
                : SvgPicture.asset(
                    asset,
                    width: width,
                    height: height,
                    colorFilter: ColorFilter.mode(
                      context.onPrimaryContainerColor,
                      BlendMode.srcIn,
                    ),
                  )
            : SvgPicture.asset(
                asset,
                width: width,
                height: height,
                colorFilter: ColorFilter.mode(
                  color!,
                  BlendMode.srcIn,
                ),
              )
        : color != null
            ? SvgPicture.asset(
                asset,
                width: width,
                height: height,
                colorFilter: ColorFilter.mode(
                  color!,
                  BlendMode.srcIn,
                ),
              )
            : SvgPicture.asset(
                asset,
                width: width,
                height: height,
              );
  }
}
