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

  ColorScheme get _colorScheme => theme.colorScheme;

  Color get primaryColor => _colorScheme.primary;
  Color get secondaryColor => _colorScheme.secondary;
  Color get backgroundColor => _colorScheme.background;
  Color get primaryContainerColor => _colorScheme.primaryContainer;
  Color get surfaceColor => _colorScheme.surface;
  Color get outlineColor => _colorScheme.outline;
  Color get scrimColor => _colorScheme.scrim;
  Color get errorColor => _colorScheme.error;
  Color get onPrimaryColor => _colorScheme.onPrimary;
  Color get onSecondaryColor => _colorScheme.onSecondary;
  Color get onBackgroundColor => _colorScheme.onBackground;
  Color get onSurfaceColor => _colorScheme.onSurface;
  Color get onSurfaceVarientColor => _colorScheme.onSurfaceVariant;
  Color get onErrorColor => _colorScheme.onError;
  Color get onPrimaryContainerColor => _colorScheme.onPrimaryContainer;
  Color get onSecondaryContainerColor => _colorScheme.onSecondaryContainer;
  Color get primaryOrLightColor => isLight ? primaryColor : onBackgroundColor;

  bool get isDark => _colorScheme.brightness == Brightness.dark;
  bool get isLight => _colorScheme.brightness == Brightness.light;
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
