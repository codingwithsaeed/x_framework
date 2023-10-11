import 'package:flutter/material.dart';
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
            Align(alignment: Alignment.centerLeft, child: _buildButton(context, XAssets.arrowLeft, onBack)),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 60),
                child: content ?? XText(title),
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
        width: 40,
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: XDimens.padding),
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
        width: 40,
        height: 40,
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
  Size get preferredSize => const Size.fromHeight(60);
}