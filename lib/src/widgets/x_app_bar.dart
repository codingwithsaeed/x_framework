import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:x_framework/x_framework.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? leadingAsset;
  final VoidCallback? onLeading;
  final VoidCallback? onBack;
  final Color? color;
  final Color? iconColor;
  final Color? iconBorderColor;
  final Widget? content;
  final bool leadingBadge;
  final bool hasBack;
  final double? height;

  const XAppBar({
    Key? key,
    required this.title,
    this.leadingAsset,
    this.onLeading,
    this.onBack,
    this.color,
    this.iconColor,
    this.iconBorderColor,
    this.content,
    this.height,
    this.hasBack = true,
    this.leadingBadge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: preferredSize.height,
        decoration: BoxDecoration(color: color ?? context.backgroundColor),
        child: Stack(
          textDirection: TextDirection.ltr,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: hasBack
                  ? _buildButton(
                      context,
                      XAssets.arrowLeft,
                      onBack ?? () => context.pop(),
                    )
                  : const SizedBox(),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(left: 20.h, right: 20.h),
                child: content ?? XText(title, style: context.titleMedium),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: leadingAsset == null
                  ? const SizedBox()
                  : _buildLeadingButton(context, leadingAsset!, onLeading ?? () {}),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String asset, VoidCallback? onPressed) {
    return GestureDetector(
      onTap: onPressed ?? onBack,
      child: Container(
        width: 40.h,
        height: 40.h,
        margin: EdgeInsets.all(XDimens.sPadding.h),
        decoration: BoxDecoration(
          color: color ?? context.primaryContainerColor,
          border: Border.all(
            color: iconBorderColor ?? context.outlineColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(XDimens.sPadding),
        ),
        child: Center(
          child: SvgPicture.asset(
            asset,
            package: 'x_framework',
            colorFilter: ColorFilter.mode(
              iconColor ?? context.onPrimaryContainerColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeadingButton(BuildContext context, String asset, VoidCallback? onPressed) {
    return GestureDetector(
      onTap: onPressed ?? onBack,
      child: Container(
        width: 40.h,
        height: 40.h,
        margin: const EdgeInsets.symmetric(horizontal: XDimens.padding),
        decoration: BoxDecoration(
          color: color ?? context.primaryContainerColor,
          border: Border.all(
            color: iconBorderColor ?? context.outlineColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(XDimens.sPadding),
        ),
        padding: leadingBadge ? const EdgeInsets.only(top: 4, left: 4) : EdgeInsets.zero,
        child: leadingBadge
            ? Badge(
                alignment: AlignmentDirectional.topEnd,
                child: Center(
                  child: SvgPicture.asset(
                    asset,
                    colorFilter: ColorFilter.mode(iconColor ?? context.onPrimaryContainerColor, BlendMode.srcIn),
                  ),
                ),
              )
            : Center(
                child: SvgPicture.asset(
                  asset,
                  colorFilter: ColorFilter.mode(iconColor ?? context.onPrimaryContainerColor, BlendMode.srcIn),
                ),
              ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 56.h);
}
