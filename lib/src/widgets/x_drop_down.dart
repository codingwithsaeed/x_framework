import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_framework/x_framework.dart';

class XDropDown<T> extends StatelessWidget {
  const XDropDown({
    Key? key,
    this.showIcon = true,
    this.isRtl = true,
    this.iconColor,
    this.borderColor,
    required this.items,
    required this.value,
    this.onChanged,
    this.hint,
    this.backgroundColor,
    this.centerValue = false,
    this.centerTitle = false,
    this.title,
  }) : super(key: key);
  final String? hint;
  final String value;
  final bool showIcon;
  final Color? backgroundColor;
  final List<T> items;
  final void Function(T?)? onChanged;
  final bool centerValue;
  final String? title;
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
          contentWidget:
              // ListView.separated(
              //   itemBuilder: (_, index) => XTextButton(
              //     text: items[index].toString(),
              //     color: context.scheme.primaryContainer,
              //     borderColor: context.scheme.outline,
              //     onTap: () {
              //       context.pop();
              //       onChanged?.call(items[index]);
              //     },
              //   ),
              //   separatorBuilder: (_, __) => SizedBox(height: XDimens.sPadding.h),
              //   itemCount: items.length,
              // ),
              SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: items
                  .map(
                    (e) => XTextButton(
                      text: e.toString(),
                      color: context.scheme.primaryContainer,
                      borderColor: context.scheme.outline,
                      onTap: () {
                        context.pop();
                        onChanged?.call(e);
                      },
                    ).marginOnly(bottom: XDimens.sPadding.h),
                  )
                  .toList(),
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null) ...[
            XText(
              title ?? '',
              align: centerTitle ? TextAlign.center : TextAlign.start,
              style: context.titleSmall,
            ),
            SizedBox(height: XDimens.xsPadding.h),
          ],
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(XDimens.sPadding),
                color: backgroundColor ?? context.scheme.primaryContainer,
                border: Border.all(color: borderColor ?? context.scheme.outline)),
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
                      textAlign: centerTitle ? TextAlign.center : TextAlign.start,
                      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                      style: context.bodyMedium.copyWith(
                          color: context.scheme.primaryContainer,
                          fontFamily: isRtl ? XFonts.iransans.name : XFonts.vazir.name),
                    ),
                  ),
                  showIcon
                      ? XSvg(
                          asset: XAssets.arrowDown, color: iconColor ?? context.scheme.outline, package: 'x_framework')
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
