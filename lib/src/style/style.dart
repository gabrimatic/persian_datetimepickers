import 'package:flutter/material.dart';

class PersianDateTimeStyle {
  /// This is the color of the numbers
  ///
  /// The default value is the app secondery color
  ///
  /// You can set the secendery color like this:
  /// ```dart
  /// ThemeData themeData = ThemeData();
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

  /// The heading text style
  ///
  /// This is the main title on top of the dialog
  final TextStyle headingStyle;

  /// This is the title text style
  ///
  /// Title is the text that show on top of each numberpicker
  ///
  /// Example: "Year", "Minute" and etc
  final TextStyle titleStyle;

  /// This is the selected number text style
  final TextStyle numbersStyle;

  /// This the text style of the cancel button
  final TextStyle cancelButtonTextStyle;

  /// The save button text style
  ///
  /// The default value is the app secondery color
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
