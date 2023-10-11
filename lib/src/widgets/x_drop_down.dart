import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';

class XDropDown<T> extends StatelessWidget {
  const XDropDown({
    Key? key,
    this.showIcon = true,
    this.centerTitle = false,
    this.isRtl = true,
    this.iconColor,
    this.borderColor,
    required this.items,
    required this.value,
    this.onChanged,
    this.hint,
    this.backgroundColor,
  }) : super(key: key);
  final String? hint;
  final String value;
  final bool showIcon;
  final Color? backgroundColor;
  final List<T> items;
  final void Function(T?)? onChanged;
  final bool centerTitle;
  final bool isRtl;
  final Color? iconColor;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.clearFocus();
        XSheets.showSheet(
          context,
          title: hint ?? 'انتخاب کنید',
          titleFontSize: 14,
          hasCancelButton: false,
          actions: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: items
                .map((e) => XTextButton(
                      text: e.toString(),
                      color: context.primaryContainerColor,
                      borderColor: context.outlineColor,
                      onTap: () {
                        context.pop();
                        onChanged?.call(e);
                      },
                    ))
                .toList(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(XDimens.sPadding),
            color: backgroundColor ?? context.primaryContainerColor,
            border: Border.all(color: borderColor ?? context.outlineColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  value.isEmpty ? 'انتخاب کنید' : value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: centerTitle ? TextAlign.center : TextAlign.right,
                  textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                  style: context.bodyMedium.copyWith(
                      color: context.onPrimaryContainerColor,
                      fontFamily: isRtl ? XFonts.iransans.name : XFonts.vazir.name),
                ),
              ),
              showIcon ? XSvg(asset: XAssets.arrowDown, color: iconColor ?? context.outlineColor) : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
