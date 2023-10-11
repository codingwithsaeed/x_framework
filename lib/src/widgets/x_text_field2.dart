import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:x_framework/x_framework.dart';

class XTextField2 extends StatefulWidget {
  const XTextField2({
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
  }) : super(key: key);
  final TextEditingController? controller;
  final bool isMultiLine;
  final void Function(String)? onChange;
  final Color? color;
  final Color? hintColor;
  final Color? textColor;
  final Color? borderColor;
  final Widget? icon;
  final String? hint;
  final String? error;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final int? maxLength;
  final bool autoFocus;
  final String? prefixText;
  final TextDirection? direction;
  final TextAlign? align;

  @override
  State<XTextField2> createState() => _XTextField2State();
}

class _XTextField2State extends State<XTextField2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
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
                    TextSelection.fromPosition(
                        TextPosition(offset: widget.controller!.text.length - 1))) {
                  setState(() {
                    widget.controller!.selection = TextSelection.fromPosition(
                        TextPosition(offset: widget.controller!.text.length));
                  });
                }
              }
            },
            style: context.bodyMedium
                .copyWith(color: widget.textColor ?? context.onPrimaryContainerColor),
            keyboardType: widget.textInputType,
            textInputAction: widget.textInputAction,
            decoration: InputDecoration(
                suffixText: widget.prefixText,
                //errorText: widget.error,
                prefixStyle: context.primaryTitleSmall,
                suffixStyle: context.primaryTitleSmall,
                hintStyle: context.bodySmall
                    .copyWith(color: widget.hintColor ?? context.onPrimaryContainerColor),
                icon: widget.icon,
                hintText: widget.hint,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: widget.icon == null ? 16 : 0, vertical: 8)),
            maxLines: widget.isMultiLine ? 4 : 1,
          ),
        ),
        if (widget.error != null && widget.error!.isNotEmpty) ...[
          const SizedBox(height: XDimens.sPadding),
          XText(widget.error!, color: context.errorColor),
        ]
      ],
    );
  }
}
