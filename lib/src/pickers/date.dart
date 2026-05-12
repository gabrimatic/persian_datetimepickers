import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shamsi_date/shamsi_date.dart';

import '../../persian_datetimepickers.dart';
import '../utils/utils.dart';

Future<int?> showPersianDatePickerTimestamp({
  required BuildContext context,
  DateTime? initialDate,
  bool isJalali = true,
  PersianDateTimeStyle? persianDateTimeStyle,
  DateTime? firstDate,
  DateTime? lastDate,
  String? titleText,
  String? yearLabelText,
  String? monthLabelText,
  String? dayLabelText,
  String? cancelText,
  String? saveText,
}) async {
  final picked = await showPersianDatePicker(
    context: context,
    initialDate: initialDate,
    isJalali: isJalali,
    persianDateTimeStyle: persianDateTimeStyle,
    firstDate: firstDate,
    lastDate: lastDate,
    titleText: titleText,
    yearLabelText: yearLabelText,
    monthLabelText: monthLabelText,
    dayLabelText: dayLabelText,
    cancelText: cancelText,
    saveText: saveText,
  );

  return picked?.millisecondsSinceEpoch;
}

Future<DateTime?> showPersianDatePicker({
  required BuildContext context,
  DateTime? initialDate,
  bool isJalali = true,
  PersianDateTimeStyle? persianDateTimeStyle,
  DateTime? firstDate,
  DateTime? lastDate,
  String? titleText,
  String? yearLabelText,
  String? monthLabelText,
  String? dayLabelText,
  String? cancelText,
  String? saveText,
}) async {
  DateTime? picked;
  final style = persianDateTimeStyle ??
      PersianDateTimeStyle(
        color: Theme.of(context).colorScheme.secondary,
      );
  if (persianDateTimeStyle == null) {
    style.saveButtonTextColor = Theme.of(context).colorScheme.secondary;
  }

  final range = _DatePickerRange.fromDates(
    isJalali: isJalali,
    firstDate: firstDate,
    lastDate: lastDate,
  );
  var selected = range.clamp(
    _CalendarDate.fromDateTime(
      initialDate ?? DateTime.now(),
      isJalali: isJalali,
    ),
  );

  await showDialog(
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: isJalali ? TextDirection.rtl : TextDirection.ltr,
        child: AlertDialog(
          title: Text(
            titleText ?? (isJalali ? 'انتخاب تاریخ' : 'Pick a date'),
            style: style.headingStyle,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                cancelText ?? (isJalali ? 'لغو' : 'Cancel'),
                style: style.cancelButtonTextStyle,
              ),
            ),
            TextButton(
              onPressed: () {
                if (isJalali) {
                  picked = Gregorian.fromJalali(
                    Jalali(selected.year, selected.month, selected.day),
                  ).toDateTime();
                } else {
                  picked = DateTime(
                    selected.year,
                    selected.month,
                    selected.day,
                  );
                }

                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                saveText ?? (isJalali ? 'ثبت' : 'Save'),
                style: style.saveButtonTextStyle,
              ),
            ),
          ],
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            final minMonth = range.minMonth(selected.year);
            final maxMonth = range.maxMonth(selected.year);
            final minDay = range.minDay(selected.year, selected.month);
            final maxDay = range.maxDay(selected.year, selected.month);

            return Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          yearLabelText ?? (isJalali ? 'سال' : 'Year'),
                          style: style.titleStyle,
                        ),
                        Theme(
                          data: ThemeData(
                            primarySwatch: getMaterialColor(style.color),
                          ),
                          child: NumberPicker(
                            haptics: true,
                            infiniteLoop: true,
                            value: selected.year,
                            textStyle: style.numbersStyle,
                            minValue: range.first.year,
                            maxValue: range.last.year,
                            onChanged: (value) => setState(() {
                              selected = range.clamp(
                                selected.copyWith(year: value),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 28),
                    child: Text(
                      '/',
                      style: style.numbersStyle,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          monthLabelText ?? (isJalali ? 'ماه' : 'Month'),
                          style: style.titleStyle,
                        ),
                        Theme(
                          data: ThemeData(
                            primarySwatch: getMaterialColor(style.color),
                          ),
                          child: NumberPicker(
                            value: selected.month,
                            textStyle: style.numbersStyle,
                            minValue: minMonth,
                            maxValue: maxMonth,
                            onChanged: (value) => setState(() {
                              selected = range.clamp(
                                selected.copyWith(month: value),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 28),
                    child: Text(
                      '/',
                      style: style.numbersStyle,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          dayLabelText ?? (isJalali ? 'روز' : 'Day'),
                          style: style.titleStyle,
                        ),
                        Theme(
                          data: ThemeData(
                            primarySwatch: getMaterialColor(style.color),
                          ),
                          child: NumberPicker(
                            value: selected.day,
                            textStyle: style.numbersStyle,
                            minValue: minDay,
                            maxValue: maxDay,
                            onChanged: (value) => setState(() {
                              selected = range.clamp(
                                selected.copyWith(day: value),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      );
    },
  );

  return picked;
}

class _CalendarDate implements Comparable<_CalendarDate> {
  const _CalendarDate(this.year, this.month, this.day);

  factory _CalendarDate.fromDateTime(
    DateTime date, {
    required bool isJalali,
  }) {
    if (isJalali) {
      final jalali = Jalali.fromDateTime(date);
      return _CalendarDate(jalali.year, jalali.month, jalali.day);
    }

    final gregorian = Gregorian.fromDateTime(date);
    return _CalendarDate(gregorian.year, gregorian.month, gregorian.day);
  }

  final int year;
  final int month;
  final int day;

  _CalendarDate copyWith({int? year, int? month, int? day}) {
    return _CalendarDate(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
    );
  }

  @override
  int compareTo(_CalendarDate other) {
    final yearCompare = year.compareTo(other.year);
    if (yearCompare != 0) return yearCompare;

    final monthCompare = month.compareTo(other.month);
    if (monthCompare != 0) return monthCompare;

    return day.compareTo(other.day);
  }
}

class _DatePickerRange {
  const _DatePickerRange({
    required this.isJalali,
    required this.first,
    required this.last,
  });

  factory _DatePickerRange.fromDates({
    required bool isJalali,
    DateTime? firstDate,
    DateTime? lastDate,
  }) {
    final defaultFirst = isJalali
        ? Gregorian.fromJalali(Jalali(1300, 1, 1)).toDateTime()
        : DateTime(1900);
    final defaultLast = isJalali
        ? Gregorian.fromJalali(Jalali(1500, 12, 29)).toDateTime()
        : DateTime(2100, 12, 31);

    final first = _CalendarDate.fromDateTime(
      firstDate ?? defaultFirst,
      isJalali: isJalali,
    );
    final last = _CalendarDate.fromDateTime(
      lastDate ?? defaultLast,
      isJalali: isJalali,
    );

    if (first.compareTo(last) > 0) {
      throw ArgumentError.value(
        firstDate,
        'firstDate',
        'must be on or before lastDate',
      );
    }

    return _DatePickerRange(isJalali: isJalali, first: first, last: last);
  }

  final bool isJalali;
  final _CalendarDate first;
  final _CalendarDate last;

  _CalendarDate clamp(_CalendarDate date) {
    final year = date.year.clamp(first.year, last.year).toInt();
    final month = date.month.clamp(minMonth(year), maxMonth(year)).toInt();
    final day =
        date.day.clamp(minDay(year, month), maxDay(year, month)).toInt();
    return _CalendarDate(year, month, day);
  }

  int minMonth(int year) => year == first.year ? first.month : 1;

  int maxMonth(int year) => year == last.year ? last.month : 12;

  int minDay(int year, int month) {
    if (year == first.year && month == first.month) {
      return first.day;
    }

    return 1;
  }

  int maxDay(int year, int month) {
    final rangeLimit =
        year == last.year && month == last.month ? last.day : null;
    final calendarLimit = _daysInMonth(year, month);
    return rangeLimit == null
        ? calendarLimit
        : rangeLimit.clamp(1, calendarLimit).toInt();
  }

  int _daysInMonth(int year, int month) {
    if (!isJalali) {
      return DateTime(year, month + 1, 0).day;
    }

    for (var day = 31; day >= 29; day--) {
      try {
        Jalali(year, month, day);
        return day;
      } on DateException {
        continue;
      }
    }

    return 29;
  }
}
