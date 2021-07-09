import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shamsi_date/extensions.dart';

Future<int?> showPersianDatePickerTimestamp({
  required BuildContext context,
  DateTime? initialDate,
  bool isJalali = true,
}) async {
  final picked = await showPersianDatePicker(
    context: context,
    initialDate: initialDate,
    isJalali: isJalali,
  );

  return picked == null ? null : picked.millisecondsSinceEpoch;
}

Future<DateTime?> showPersianDatePicker({
  required BuildContext context,
  DateTime? initialDate,
  bool isJalali = true,
}) async {
  DateTime? picked;

  int year = isJalali
      ? (initialDate == null
          ? Jalali.now().year
          : Jalali.fromDateTime(initialDate).year)
      : (initialDate == null
          ? Gregorian.now().year
          : Gregorian.fromDateTime(initialDate).year);

  int month = isJalali
      ? (initialDate == null
          ? Jalali.now().month
          : Jalali.fromDateTime(initialDate).month)
      : (initialDate == null
          ? Gregorian.now().month
          : Gregorian.fromDateTime(initialDate).month);

  int day = isJalali
      ? (initialDate == null
          ? Jalali.now().day
          : Jalali.fromDateTime(initialDate).day)
      : (initialDate == null
          ? Gregorian.now().day
          : Gregorian.fromDateTime(initialDate).day);

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(isJalali ? 'انتخاب تاریخ' : 'Pick a date'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Text(
              isJalali ? 'لغو' : 'Cancel',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (isJalali) {
                picked =
                    Gregorian.fromJalali(Jalali(year, month, day)).toDateTime();
              } else {
                picked = DateTime(year, month, day);
              }

              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Text(
              isJalali ? 'ثبت' : 'Save',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
        content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Directionality(
            textDirection: isJalali ? TextDirection.ltr : TextDirection.rtl,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        isJalali ? 'سال' : 'Year',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      NumberPicker(
                        haptics: true,
                        infiniteLoop: true,
                        value: year,
                        minValue: isJalali ? 1300 : 1900,
                        maxValue: isJalali ? 1500 : 2100,
                        onChanged: (value) => setState(() => year = value),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 28),
                  child: const Text(
                    '/',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        isJalali ? 'ماه' : 'Month',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      NumberPicker(
                        value: month,
                        minValue: 1,
                        maxValue: 12,
                        onChanged: (value) => setState(() => month = value),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 28),
                  child: const Text(
                    '/',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        isJalali ? 'روز' : 'Day',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      NumberPicker(
                        value: day,
                        minValue: 1,
                        maxValue: 31,
                        onChanged: (value) => setState(() => day = value),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      );
    },
  );

  return picked;
}
