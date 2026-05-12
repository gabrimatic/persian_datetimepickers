import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

/// Date formatting helpers.
extension PersianTimeDatePickersDateTimeExtension on DateTime {
  /// Converts the DateTime to a Persian date string.
  ///
  /// Example: 1378/05/19
  String toPersianDate() {
    final date = Jalali.fromDateTime(this);
    return '${date.year}/${date.month.toString().addExtraZero}/${date.day.toString().addExtraZero}';
  }

  /// Converts the DateTime to a readable date string.
  ///
  /// Example: شنبه، ۱۶ بهمن ۱۴۰۰
  String toFancyString({bool isJalali = true}) {
    if (isJalali) {
      final formated = Jalali.fromDateTime(this).formatter;
      return '${formated.wN}، ${formated.d} ${formated.mN} ${formated.yyyy}';
    } else {
      final formated = Gregorian.fromDateTime(this).formatter;
      return '${formated.wN}, ${formated.d} ${formated.mN} ${formated.yyyy}';
    }
  }
}

extension PersianTimeDatePickersTimeOfDayExtension on TimeOfDay {
  /// Converts the TimeOfDay to an `HH:mm` string.
  ///
  /// Example: 16:05
  String toFancyString() {
    return '${hour.toString().addExtraZero}:${minute.toString().addExtraZero}';
  }
}

extension PersianTimeDatePickersStringExtension on String {
  /// Adds a leading zero when the string has one character.
  ///
  /// Example: 1:5  ==>  01:05
  String get addExtraZero {
    String text = this;
    if (text.length == 1) text = '0$text';
    return text;
  }
}
