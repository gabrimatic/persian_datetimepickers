import 'package:flutter/material.dart';

import '../style/style.dart';

/// Returns [style], or a default style that follows the ambient theme.
///
/// The default uses the theme's secondary color as the accent and the
/// theme's on-surface color for text, so dialogs stay readable in dark mode.
PersianDateTimeStyle resolvePickerStyle(
  BuildContext context,
  PersianDateTimeStyle? style,
) {
  if (style != null) return style;

  final colorScheme = Theme.of(context).colorScheme;
  final defaults = PersianDateTimeStyle();
  TextStyle onSurface(TextStyle textStyle) =>
      textStyle.copyWith(color: colorScheme.onSurface);

  return defaults.copyWith(
    color: colorScheme.secondary,
    headingStyle: onSurface(defaults.headingStyle),
    titleStyle: onSurface(defaults.titleStyle),
    numbersStyle: onSurface(defaults.numbersStyle),
    cancelButtonTextStyle: onSurface(defaults.cancelButtonTextStyle),
    saveButtonTextStyle: defaults.saveButtonTextStyle.copyWith(
      color: colorScheme.secondary,
    ),
  );
}

/// The ambient theme with [color] as the secondary color.
///
/// `NumberPicker` paints the selected value with `colorScheme.secondary`.
ThemeData pickerAccentTheme(BuildContext context, Color color) {
  final theme = Theme.of(context);
  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(secondary: color),
  );
}
