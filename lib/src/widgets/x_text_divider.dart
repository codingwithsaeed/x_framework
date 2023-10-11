import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';


class XTextDivider extends StatelessWidget {
  final String text;
  final Color? color;

  const XTextDivider({Key? key, required this.text, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const XDivider().expand(),
        XText(
          text,
          style: context.titleMedium,
          color: context.onBackgroundColor.withOpacity(0.5),
        ),
        const XDivider().expand(),
      ],
    );
  }
}
