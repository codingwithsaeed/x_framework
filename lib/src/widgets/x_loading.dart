import 'package:flutter/material.dart';
import 'package:x_framework/x_framework.dart';

class XLoading extends StatelessWidget {
  final Color? color;
  final double? thickness;
  const XLoading({super.key, this.color, this.thickness});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? (context.isDark ? context.scheme.inverseSurface : context.scheme.primary),
        ),
        strokeWidth: thickness ?? 2,
      ),
    );
  }
}
