import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_framework/x_framework.dart';

class XSvg extends StatelessWidget {
  final String asset;
  final double? width;
  final double? height;
  final Color? color;
  final bool applyNightMode;
  final String? package;
  const XSvg({
    super.key,
    required this.asset,
    this.package,
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
                    package: package,
                  )
                : SvgPicture.asset(
                    asset,
                    package: package,
                    width: width,
                    height: height,
                    colorFilter: ColorFilter.mode(
                      context.scheme.onPrimaryContainer,
                      BlendMode.srcIn,
                    ),
                  )
            : SvgPicture.asset(
                asset,
                width: width,
                height: height,
                package: package,
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
                package: package,
                colorFilter: ColorFilter.mode(
                  color!,
                  BlendMode.srcIn,
                ),
              )
            : SvgPicture.asset(
                asset,
                width: width,
                height: height,
                package: package,
              );
  }
}
