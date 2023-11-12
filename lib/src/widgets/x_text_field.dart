import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_framework/x_framework.dart';

class XTextField extends StatefulWidget {
  const XTextField({
    Key? key,
    this.isMultiLine = false,
    this.onChange,
    this.controller,
    this.color,
    this.icon,
    this.hint,
    this.hintColor,
    this.textColor,
    this.textInputType,
    this.textInputAction,
    this.inputFormatters = const [],
    this.borderColor,
    this.maxLength,
    this.error,
    this.autoFocus = false,
    this.prefixText,
    this.direction,
    this.align,
    this.contentPadding,
    this.showErrorInside = false,
    this.isDense = true,
    this.title,
    this.centerTitle = false,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool isMultiLine;
  final bool centerTitle;
  final void Function(String)? onChange;
  final Color? color;
  final Color? hintColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? icon;
  final String? hint;
  final String? title;
  final String? error;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final int? maxLength;
  final bool autoFocus;
  final String? prefixText;
  final TextDirection? direction;
  final TextAlign? align;
  final bool showErrorInside;
  final bool isDense;
  final EdgeInsetsGeometry? contentPadding;

  @override
  State<XTextField> createState() => _XTextField2State();
}

class _XTextField2State extends State<XTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.title != null) ...[
          XText(
            widget.title ?? '',
            align: widget.centerTitle ? TextAlign.center : TextAlign.start,
            style: context.titleSmall,
          ),
          SizedBox(height: XDimens.xsPadding.h),
        ],
        Container(
          padding: widget.contentPadding ?? EdgeInsets.symmetric(horizontal: XDimens.sPadding.h).h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(XDimens.sPadding),
              color: widget.color ?? context.primaryContainerColor,
              border: Border.all(color: widget.borderColor ?? context.outlineColor)),
          child: TextField(
            autofocus: widget.autoFocus,
            maxLength: widget.maxLength,
            inputFormatters: widget.inputFormatters,
            controller: widget.controller,
            onChanged: widget.onChange,
            textDirection: widget.direction,
            textAlign: widget.align ?? TextAlign.start,
            onTap: () {
              if (widget.controller != null) {
                if (widget.controller!.selection ==
                    TextSelection.fromPosition(TextPosition(offset: widget.controller!.text.length - 1))) {
                  setState(() {
                    widget.controller!.selection =
                        TextSelection.fromPosition(TextPosition(offset: widget.controller!.text.length));
                  });
                }
              }
            },
            style: context.bodyMedium.copyWith(color: widget.textColor ?? context.onPrimaryContainerColor),
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(
              suffixText: widget.prefixText,
              errorText: widget.showErrorInside ? widget.error : null,
              prefixStyle: context.primaryTitleSmall,
              suffixStyle: context.primaryTitleSmall,
              hintStyle: context.bodySmall.copyWith(color: widget.hintColor ?? context.onPrimaryContainerColor),
              icon: widget.icon,
              isDense: widget.isDense,
              hintText: widget.hint,
              border: InputBorder.none,
            ),
            maxLines: widget.isMultiLine ? 4 : 1,
          ),
        ),
        if (widget.error != null && widget.error!.isNotEmpty && !widget.showErrorInside) ...[
          SizedBox(height: XDimens.sPadding.h),
          XText(
            widget.error!,
            color: context.errorColor,
            align: TextAlign.start,
            margin: EdgeInsetsDirectional.only(start: XDimens.sPadding.h),
          ),
        ]
      ],
    );
  }
}
