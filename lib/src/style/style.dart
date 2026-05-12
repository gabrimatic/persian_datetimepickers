import 'package:flutter/material.dart';

class PersianDateTimeStyle {
  /// The accent color used by the number pickers.
  ///
  /// By default, dialogs use the app secondary color.
  ///
  /// Set the secondary color like this:
  /// ```dart
  /// final themeData = ThemeData();
  /// MaterialApp(
  ///   home: const PersianDatePickersExample(),
  ///   theme: themeData.copyWith(
  ///     colorScheme: themeData.colorScheme.copyWith(
  ///       secondary: Colors.purple,
  ///     ),
  ///   ),
  /// );
  /// ```
  final Color color;

  /// The main title text style.
  final TextStyle headingStyle;

  /// The label text style above each number picker.
  final TextStyle titleStyle;

  /// The selected number text style.
  final TextStyle numbersStyle;

  /// The cancel button text style.
  final TextStyle cancelButtonTextStyle;

  /// The save button text style.
  TextStyle saveButtonTextStyle;

  PersianDateTimeStyle({
    this.color = Colors.blue,
    this.headingStyle = const TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    this.titleStyle = const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    this.numbersStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.saveButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    this.cancelButtonTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
  });

  set saveButtonTextColor(Color color) {
    saveButtonTextStyle = saveButtonTextStyle.copyWith(color: color);
  }

  PersianDateTimeStyle copyWith({
    Color? color,
    TextStyle? headingStyle,
    TextStyle? titleStyle,
    TextStyle? numbersStyle,
    TextStyle? saveButtonTextStyle,
    TextStyle? cancelButtonTextStyle,
  }) {
    return PersianDateTimeStyle(
      color: color ?? this.color,
      headingStyle: headingStyle ?? this.headingStyle,
      titleStyle: titleStyle ?? this.titleStyle,
      numbersStyle: numbersStyle ?? this.numbersStyle,
      saveButtonTextStyle: saveButtonTextStyle ?? this.saveButtonTextStyle,
      cancelButtonTextStyle:
          cancelButtonTextStyle ?? this.cancelButtonTextStyle,
    );
  }
}
