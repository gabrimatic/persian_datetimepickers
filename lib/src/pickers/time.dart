import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

Future<TimeOfDay?> showPersianTimePicker({
  required BuildContext context,
  TimeOfDay? initialTime,
  bool isJalali = true,
}) async {
  TimeOfDay? picked;

  int hour = initialTime?.hour ?? TimeOfDay.now().hour;
  int minute = initialTime?.minute ?? TimeOfDay.now().minute;

  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(isJalali ? 'انتخاب ساعت' : 'Pick a time'),
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
              picked = TimeOfDay(hour: hour, minute: minute);

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
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      NumberPicker(
                        haptics: true,
                        infiniteLoop: true,
                        value: hour,
                        minValue: 1,
                        maxValue: 23,
                        onChanged: (value) => setState(() => hour = value),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 26),
                  child: const Text(
                    ':',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        isJalali ? 'دقیقه' : 'Minute',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      NumberPicker(
                        value: minute,
                        minValue: 1,
                        maxValue: 59,
                        onChanged: (value) => setState(() => minute = value),
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
