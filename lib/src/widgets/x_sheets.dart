import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_framework/x_framework.dart';

abstract class XSheets {
  const XSheets._();

  static void showDeleteSheet(
    BuildContext context,
    VoidCallback onAccept, {
    String? title,
    String? acceptText,
    String? cancelText,
  }) {
    showSheet(
      context,
      titleColor: context.errorColor,
      hasCancelButton: false,
      actions: Row(
        children: [
          XTextButton(
            color: context.errorColor,
            borderColor: context.errorColor,
            height: 35,
            onTap: onAccept,
            text: acceptText ?? 'بله',
            textColor: context.onPrimaryColor,
          ).expand(),
          const SizedBox(width: XDimens.sPadding),
          XTextButton(
            height: 35,
            color: context.backgroundColor,
            borderColor: context.isLight ? context.onPrimaryContainerColor.withOpacity(0.7) : context.onBackgroundColor,
            onTap: () => context.pop(),
            text: cancelText ?? 'خیر',
            textColor: context.isLight ? context.onPrimaryContainerColor.withOpacity(0.7) : context.onBackgroundColor,
          ).expand(),
        ],
      ),
      title: title ?? 'آیا از حذف  این آیتم اطمینان دارید؟',
    );
  }

  static Future<T?> showSheet<T>(
    BuildContext context, {
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    String? title,
    Color? titleColor,
    double? titleFontSize,
    String? content,
    Color? contentColor,
    bool centerContent = false,
    Widget? contentWidget,
    Widget? actions,
    bool hasCancelButton = true,
    String? cancelButtonText,
    VoidCallback? onCancelTap,
    bool dissmissible = true,
    final double? maxHeight,
  }) async {
    return await showModalBottomSheet<T>(
      isDismissible: dissmissible,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: XDimens.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(XDimens.sPadding)),
      context: context,
      builder: (context) {
        var titleColored = titleColor ?? (context.isLight ? context.primaryColor : context.onPrimaryContainerColor);
        final MediaQueryData mediaQueryData = MediaQuery.of(context);
        return ScaffoldMessenger(
          child: Builder(builder: (context) {
            return Padding(
              padding: mediaQueryData.viewInsets,
              child: Container(
                constraints: BoxConstraints(maxHeight: maxHeight ?? mediaQueryData.size.height * 0.8),
                margin: const EdgeInsets.all(XDimens.sPadding),
                decoration: BoxDecoration(
                  color: backgroundColor ?? context.backgroundColor,
                  borderRadius: BorderRadius.circular(XDimens.sPadding),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: XDimens.xsPadding.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 64,
                            height: 3,
                            decoration: BoxDecoration(
                              color: context.onSurfaceColor,
                              borderRadius: BorderRadius.circular(XDimens.padding),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: XDimens.xsPadding.h),
                      Padding(
                        padding: padding ??
                            const EdgeInsets.fromLTRB(
                              XDimens.sPadding,
                              XDimens.xsPadding,
                              XDimens.sPadding,
                              XDimens.sPadding,
                            ).h,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            if (title != null)
                              Text(
                                title,
                                textAlign: TextAlign.center,
                                style: context.titleLarge.copyWith(
                                    overflow: TextOverflow.ellipsis, fontSize: titleFontSize, color: titleColored),
                              ),
                            if (contentWidget != null || content != null) SizedBox(height: XDimens.sPadding.h),
                            if (contentWidget != null) contentWidget,
                            if (content != null)
                              Text(
                                content,
                                style: context.bodyMedium.copyWith(
                                  height: 2,
                                  color: contentColor ?? context.onBackgroundColor,
                                ),
                                textAlign: centerContent ? TextAlign.center : TextAlign.start,
                              ),
                            if (actions != null) ...[
                              SizedBox(height: XDimens.sPadding.h),
                              actions,
                            ],
                            if (hasCancelButton) ...[
                              SizedBox(height: XDimens.sPadding.h),
                              XTextButton(
                                height: 35.h,
                                color: context.backgroundColor,
                                borderColor: context.isLight
                                    ? context.onPrimaryContainerColor.withOpacity(0.7)
                                    : context.onBackgroundColor,
                                onTap: onCancelTap ?? () => context.pop(),
                                text: cancelButtonText ?? 'انصراف',
                                textColor: context.isLight
                                    ? context.onPrimaryContainerColor.withOpacity(0.7)
                                    : context.onBackgroundColor,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  static Future<T?> showCustomSheet<T>(
    BuildContext context, {
    required Widget content,
    EdgeInsetsGeometry? contentPadding,
    Color? backgroundColor,
    bool isDissmissable = true,
    double? maxHeight,
  }) async {
    return await showModalBottomSheet<T>(
      backgroundColor: Colors.transparent,
      elevation: XDimens.zero,
      isDismissible: isDissmissable,
      isScrollControlled: isDissmissable,
      enableDrag: isDissmissable,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(XDimens.sPadding),
          topRight: Radius.circular(XDimens.sPadding),
        ),
      ),
      context: context,
      builder: (context) {
        final MediaQueryData mediaQueryData = MediaQuery.of(context);
        return Padding(
          padding: mediaQueryData.viewInsets,
          child: Container(
            constraints: BoxConstraints(maxHeight: maxHeight ?? 0.8 * mediaQueryData.size.height),
            padding: contentPadding ??
                const EdgeInsets.fromLTRB(XDimens.sPadding, XDimens.xsPadding, XDimens.sPadding, XDimens.sPadding).h,
            margin: const EdgeInsets.all(XDimens.sPadding),
            decoration: BoxDecoration(
              color: backgroundColor ?? context.backgroundColor,
              borderRadius: BorderRadius.circular(XDimens.sPadding),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 64,
                      height: 3,
                      decoration: BoxDecoration(
                        color: context.onSurfaceColor,
                        borderRadius: BorderRadius.circular(XDimens.padding),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: XDimens.sPadding.h),
                Expanded(child: content),
              ],
            ),
          ),
        );
      },
    );
  }
}
