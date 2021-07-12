import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';

extension PersianTimeDatePickersDateTimeExtension on DateTime {
  String toPersianDate() {
    final date = Jalali.fromDateTime(this);
    return '${date.year}/${date.month}/${date.day}';
  }

  String toFancyString({
    bool isJalali = true,
  }) {
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
  String toFancyString() {
    return this.hour.toString().addExtraZero +
        ':' +
        this.minute.toString().addExtraZero;
  }
}

extension PersianTimeDatePickersStringExtension on String {
  String get addExtraZero {
    String text = this;
    if (text.length == 1) text = '0$text';
    return text;
  }
}
