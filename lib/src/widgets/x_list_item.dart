import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';

class XListItem extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? onMoreTap;
  final String title;
  final IconData icon;
  final Color? iconColor;
  final Widget? subtitle;
  final bool showMore;
  const XListItem({
    super.key,
    this.onTap,
    this.onMoreTap,
    this.subtitle,
    this.iconColor,
    this.showMore = true,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: iconColor ?? context.scheme.inverseSurface),
      horizontalTitleGap: XDimens.padding,
      tileColor: context.scheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(XDimens.sPadding),
        side: BorderSide(color: context.scheme.outline),
      ),
      title: XText(title, align: TextAlign.right),
      dense: true,
      subtitle: subtitle,
      trailing: showMore
          ? InkWell(
              onTap: onMoreTap,
              child: Icon(Icons.more_horiz_rounded, color: context.scheme.inverseSurface),
            )
          : null,
    );
  }
}
