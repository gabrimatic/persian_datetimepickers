import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

/// The custom extensions for DateTime
extension PersianTimeDatePickersDateTimeExtension on DateTime {
  /// Converts the DateTime to a Persian date in String format.
  ///
  /// Example: 1378/05/19
  String toPersianDate() {
    final date = Jalali.fromDateTime(this);
    return '${date.year}/${date.month.toString().addExtraZero}/${date.day.toString().addExtraZero}';
  }

  /// This method converts the DateTime to a fancy string.
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
  /// This method converts the TimeOfDay to a fancy string.
  ///
  /// Example: 16:05
  String toFancyString() {
    return this.hour.toString().addExtraZero +
        ':' +
        this.minute.toString().addExtraZero;
  }
}

extension PersianTimeDatePickersStringExtension on String {
  /// This method add an extra zero to the beggining of an String
  ///
  /// Example: 1:5  ==>  01:05
  String get addExtraZero {
    String text = this;
    if (text.length == 1) text = '0$text';
    return text;
  }
}
