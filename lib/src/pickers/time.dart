import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

Future<TimeOfDay?> showPersianTimePicker({
  required BuildContext context,
  TimeOfDay? initialTime,
  bool isJalali = true,
  Color color = Colors.blue,
}) async {
  TimeOfDay? picked;

  int hour = initialTime?.hour ?? TimeOfDay.now().hour;
  int minute = initialTime?.minute ?? TimeOfDay.now().minute;

  final materialColor = MaterialColor(
    color.value,
    {
      50: Color.fromRGBO(
        color.red,
        color.green,
        color.blue,
        .1,
      ),
      100: Color.fromRGBO(
        color.red,
        color.green,
        color.blue,
        .2,
      ),
      200: Color.fromRGBO(
        color.red,
        color.green,
        color.blue,
        .3,
      ),
      300: Color.fromRGBO(
        color.red,
        color.green,
        color.blue,
        .4,
      ),
      400: Color.fromRGBO(
        color.red,
        color.green,
        color.blue,
        .5,
      ),
      500: Color.fromRGBO(
        color.red,
        color.green,
        color.blue,
        .6,
      ),
      600: Color.fromRGBO(
        color.red,
        color.green,
        color.blue,
        .7,
      ),
      700: Color.fromRGBO(
        color.red,
        color.green,
        color.blue,
        .8,
      ),
      800: Color.fromRGBO(
        color.red,
        color.green,
        color.blue,
        .9,
      ),
      900: Color.fromRGBO(
        color.red,
        color.green,
        color.blue,
        1,
      ),
    },
  );

  await showDialog(
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: isJalali ? TextDirection.rtl : TextDirection.ltr,
        child: AlertDialog(
          title: Text(
            isJalali ? 'انتخاب ساعت' : 'Pick a time',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
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
                  color: color,
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
                        Theme(
                          data: ThemeData(
                            primarySwatch: materialColor,
                          ),
                          child: NumberPicker(
                            haptics: true,
                            infiniteLoop: true,
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
                        Theme(
                          data: ThemeData(
                            primarySwatch: materialColor,
                          ),
                          child: NumberPicker(
                            value: minute,
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
