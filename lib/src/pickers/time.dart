import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import '../style/style.dart';
import '../utils/utils.dart';

Future<TimeOfDay?> showPersianTimePicker({
  required BuildContext context,
  TimeOfDay? initialTime,
  bool isJalali = true,
  PersianDateTimeStyle? persianDateTimeStyle,
}) async {
  TimeOfDay? picked;
  final style = persianDateTimeStyle ??= PersianDateTimeStyle(
    color: Theme.of(context).colorScheme.secondary,
  )..saveButtonTextColor = Theme.of(context).colorScheme.secondary;

  int hour = initialTime?.hour ?? TimeOfDay.now().hour;
  int minute = initialTime?.minute ?? TimeOfDay.now().minute;

  await showDialog(
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: isJalali ? TextDirection.rtl : TextDirection.ltr,
        child: AlertDialog(
          title: Text(
            isJalali ? 'انتخاب ساعت' : 'Pick a time',
            style: style.headingStyle,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                isJalali ? 'لغو' : 'Cancel',
                style: style.cancelButtonTextStyle,
              ),
            ),
            TextButton(
              onPressed: () {
                picked = TimeOfDay(hour: hour, minute: minute);

                Navigator.of(context, rootNavigator: true).pop();
              },
              child: Text(
                isJalali ? 'ثبت' : 'Save',
                style: style.saveButtonTextStyle,
              ),
            ),
          ],
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
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
                          isJalali ? 'ساعت' : 'Hour',
                          style: style.titleStyle,
                        ),
                        Theme(
                          data: ThemeData(
                            primarySwatch: getMaterialColor(style.color),
                          ),
                          child: NumberPicker(
                            haptics: true,
                            infiniteLoop: true,
                            textStyle: style.numbersStyle,
                            value: hour,
                            minValue: 1,
                            maxValue: 23,
                            onChanged: (value) => setState(() => hour = value),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 26),
                    child: Text(
                      ':',
                      style: style.numbersStyle,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          isJalali ? 'دقیقه' : 'Minute',
                          style: style.titleStyle,
                        ),
                        Theme(
                          data: ThemeData(
                            primarySwatch: getMaterialColor(style.color),
                          ),
                          child: NumberPicker(
                            value: minute,
                            textStyle: style.numbersStyle,
                            minValue: 0,
                            maxValue: 59,
                            onChanged: (value) =>
                                setState(() => minute = value),
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
