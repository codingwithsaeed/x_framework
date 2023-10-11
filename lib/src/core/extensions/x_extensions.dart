import 'package:flutter/material.dart';
import '../consts/x_dimens.dart';

extension WidgetExtensions on Widget {
  Widget center() => Center(child: this);
  Widget expand({int flex = 1}) => Expanded(flex: flex, child: this);
  Widget containColor(Color color) => Container(color: color, child: this);

  Widget margin([EdgeInsetsGeometry margin = const EdgeInsets.all(XDimens.sPadding)]) =>
      Padding(padding: margin, child: this);

  Widget marginAll([double margin = XDimens.sPadding]) => Padding(padding: EdgeInsets.all(margin), child: this);

  Widget marginLTRB([
    double left = XDimens.zero,
    double top = XDimens.zero,
    double right = XDimens.zero,
    double bottom = XDimens.zero,
  ]) =>
      Padding(padding: EdgeInsets.fromLTRB(left, top, right, bottom), child: this);

  Widget marginSymmetric({double? vertical, double? horizontal}) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical ?? XDimens.zero,
          horizontal: horizontal ?? XDimens.zero,
        ),
        child: this,
      );

  Widget marginOnly({double? left, double? top, double? right, double? bottom}) => Padding(
        padding: EdgeInsets.only(
          left: left ?? XDimens.zero,
          top: top ?? XDimens.zero,
          right: right ?? XDimens.zero,
          bottom: bottom ?? XDimens.zero,
        ),
        child: this,
      );
}

extension ThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get _textTheme => theme.textTheme;

  TextStyle get titleLarge => _textTheme.titleLarge!;
  TextStyle get titleMedium => _textTheme.titleMedium!;
  TextStyle get titleSmall => _textTheme.titleSmall!;
  TextStyle get primaryTitleLarge => _textTheme.titleLarge!.copyWith(color: primaryColor);
  TextStyle get primaryTitleMedium => _textTheme.titleMedium!.copyWith(color: primaryColor);
  TextStyle get primaryTitleSmall => _textTheme.titleSmall!.copyWith(color: primaryColor);

  TextStyle get bodyLarge => _textTheme.bodyLarge!;
  TextStyle get bodyMedium => _textTheme.bodyMedium!;
  TextStyle get bodySmall => _textTheme.bodySmall!;
  TextStyle get primaryBodyLarge => _textTheme.bodyLarge!.copyWith(color: primaryColor);
  TextStyle get primaryBodyMedium => _textTheme.bodyMedium!.copyWith(color: primaryColor);
  TextStyle get primaryBodySmall => _textTheme.bodySmall!.copyWith(color: primaryColor);

  ColorScheme get scheme => theme.colorScheme;

  Color get primaryColor => scheme.primary;
  Color get secondaryColor => scheme.secondary;
  Color get backgroundColor => scheme.background;
  Color get primaryContainerColor => scheme.primaryContainer;
  Color get surfaceColor => scheme.surface;
  Color get outlineColor => scheme.outline;
  Color get scrimColor => scheme.scrim;
  Color get errorColor => scheme.error;
  Color get onPrimaryColor => scheme.onPrimary;
  Color get onSecondaryColor => scheme.onSecondary;
  Color get onBackgroundColor => scheme.onBackground;
  Color get onSurfaceColor => scheme.onSurface;
  Color get onSurfaceVarientColor => scheme.onSurfaceVariant;
  Color get onErrorColor => scheme.onError;
  Color get onPrimaryContainerColor => scheme.onPrimaryContainer;
  Color get onSecondaryContainerColor => scheme.onSecondaryContainer;
  Color get primaryOrLightColor => isLight ? primaryColor : onBackgroundColor;

  bool get isDark => scheme.brightness == Brightness.dark;
  bool get isLight => scheme.brightness == Brightness.light;
}

extension NavigateExtensions on BuildContext {
  NavigatorState get _navigator => Navigator.of(this);

  void pop<T extends Object?>([T? result]) {
    if (_navigator.canPop()) _navigator.pop<T>(result);
  }

  Future<T?> pushNamed<T extends Object?>(String routeName, {Object? arguments}) {
    return _navigator.pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigator.pushReplacementNamed<T, TO>(routeName, arguments: arguments, result: result);
  }
}

extension ContextExt on BuildContext {
  void clearFocus() => FocusManager.instance.primaryFocus?.unfocus();
}
