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
            color: titleColor ?? context.scheme.inverseSurface,
            style: context.titleMedium,
          ),
          const SizedBox(height: XDimens.sPadding),
        ],
        Row(
          children: [
            XTextButton(
              text: editText ?? 'ویرایش',
              color: context.isDark ? context.scheme.onSurface.withAlpha(26) : context.scheme.primary.withAlpha(26),
              borderColor: context.isDark ? context.scheme.onSurface.withAlpha(204) : context.scheme.primary,
              textColor: context.isDark ? context.scheme.onSurface.withAlpha(204) : context.scheme.primary,
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
              color: context.scheme.error.withAlpha(26),
              borderColor: context.scheme.error,
              textColor: context.scheme.error,
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
          subtitle: subtitle != null ? XText(subtitle!, color: context.scheme.inverseSurface) : null,
        ),
        const SizedBox(height: XDimens.sPadding),
        Row(
          children: [
            XTextButton(
              text: editText ?? 'ویرایش',
              color: context.isDark ? context.scheme.onSurface.withAlpha(26) : context.scheme.primary.withAlpha(26),
              borderColor: context.isDark ? context.scheme.onSurface.withAlpha(204) : context.scheme.primary,
              textColor: context.isDark ? context.scheme.onSurface.withAlpha(204) : context.scheme.primary,
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
              color: context.scheme.error.withAlpha(26),
              borderColor: context.scheme.error,
              textColor: context.scheme.error,
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
      color: context.scheme.primaryContainer,
      borderRadius: BorderRadius.circular(XDimens.sPadding),
      padding: const EdgeInsets.all(XDimens.sPadding + XDimens.xsPadding),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: iconColor ?? context.scheme.inverseSurface),
            const SizedBox(width: XDimens.sPadding),
          ],
          XText(title).expand(),
          if (value != null) ...[
            const SizedBox(width: XDimens.sPadding),
            XText(value!, color: context.scheme.inverseSurface, align: TextAlign.end).expand(),
          ],
        ],
      ),
    );
  }
}
