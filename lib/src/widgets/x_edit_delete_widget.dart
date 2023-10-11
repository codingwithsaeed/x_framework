import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';


class XEditDeleteWidget extends StatelessWidget {
  final String? title;
  final Color? titleColor;
  final String? editText;
  final String? deleteText;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const XEditDeleteWidget({
    super.key,
    this.title,
    this.titleColor,
    this.editText,
    this.deleteText,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null) ...[
          XText(
            title!,
            color: titleColor ?? context.onSurfaceColor,
            style: context.titleMedium,
          ),
          const SizedBox(height: XDimens.sPadding),
        ],
        Row(
          children: [
            XTextButton(
              text: editText ?? 'ویرایش',
              color:
                  context.isDark ? context.onBackgroundColor.withOpacity(0.1) : context.primaryColor.withOpacity(0.1),
              borderColor: context.isDark ? context.onBackgroundColor.withOpacity(0.8) : context.primaryColor,
              textColor: context.isDark ? context.onBackgroundColor.withOpacity(0.8) : context.primaryColor,
              onTap: () {
                context.pop();
                onEdit();
              },
            ).expand(),
            const SizedBox(width: XDimens.sPadding),
            XTextButton(
              text: deleteText ?? 'حذف',
              onTap: () {
                XSheets.showDeleteSheet(
                  context,
                  () {
                    context.pop();
                    onDelete();
                    context.pop();
                  },
                );
              },
              color: context.errorColor.withOpacity(0.1),
              borderColor: context.errorColor,
              textColor: context.errorColor,
            ).expand(),
          ],
        ),
      ],
    );
  }
}

class XItemEditDeleteWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData icon;
  final Color? titleColor;
  final Color? iconColor;
  final String? editText;
  final String? deleteText;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const XItemEditDeleteWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onEdit,
    required this.onDelete,
    this.titleColor,
    this.iconColor,
    this.subtitle,
    this.editText,
    this.deleteText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        XListItem(
          title: title,
          icon: icon,
          showMore: false,
          iconColor: iconColor,
          subtitle: subtitle != null ? XText(subtitle!, color: context.onSurfaceColor) : null,
        ),
        const SizedBox(height: XDimens.sPadding),
        Row(
          children: [
            XTextButton(
              text: editText ?? 'ویرایش',
              color:
                  context.isDark ? context.onBackgroundColor.withOpacity(0.1) : context.primaryColor.withOpacity(0.1),
              borderColor: context.isDark ? context.onBackgroundColor.withOpacity(0.8) : context.primaryColor,
              textColor: context.isDark ? context.onBackgroundColor.withOpacity(0.8) : context.primaryColor,
              onTap: () {
                context.pop();
                onEdit();
              },
            ).expand(),
            const SizedBox(width: XDimens.sPadding),
            XTextButton(
              text: deleteText ?? 'حذف',
              onTap: () {
                XSheets.showDeleteSheet(
                  context,
                  () {
                    context.pop();
                    onDelete();
                    context.pop();
                  },
                );
              },
              color: context.errorColor.withOpacity(0.1),
              borderColor: context.errorColor,
              textColor: context.errorColor,
            ).expand(),
          ],
        ),
      ],
    );
  }
}

class XMoreItem extends StatelessWidget {
  const XMoreItem({
    super.key,
    this.icon,
    this.value,
    this.iconColor,
    required this.title,
  });

  final IconData? icon;
  final String title;
  final String? value;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return XContainer(
      color: context.primaryContainerColor,
      borderRadius: BorderRadius.circular(XDimens.sPadding),
      padding: const EdgeInsets.all(XDimens.sPadding + XDimens.xsPadding),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: iconColor ?? context.onSurfaceColor),
            const SizedBox(width: XDimens.sPadding),
          ],
          XText(title).expand(),
          if (value != null) ...[
            const SizedBox(width: XDimens.sPadding),
            XText(value!, color: context.onSurfaceColor, align: TextAlign.end).expand(),
          ],
        ],
      ),
    );
  }
}
