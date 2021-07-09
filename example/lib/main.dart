import 'package:flutter/material.dart';
import 'package:persian_datetimepickers/persian_datetimepickers.dart';

void main() {
  runApp(
    MaterialApp(
      home: const PersianDatePickersExample(),
    ),
  );
}

class PersianDatePickersExample extends StatefulWidget {
  const PersianDatePickersExample({Key? key}) : super(key: key);

  @override
  _PersianDatePickersExampleState createState() =>
      _PersianDatePickersExampleState();
}

class _PersianDatePickersExampleState extends State<PersianDatePickersExample> {
  TimeOfDay? _pickedTime;
  DateTime? _pickedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title:
              _pickedTime == null ? Text('Pick a time') : Text('Picked time:'),
          trailing: _pickedTime == null ? null : Text(_pickedTime.toString()),
          onTap: () async {
            final time = await showPersianTimePicker(
              context: context,
            );

            setState(() {
              _pickedTime = time;
            });
          },
        ),
        const SizedBox(height: 16),
        ListTile(
          title:
              _pickedDate == null ? Text('Pick a date') : Text('Picked date:'),
          trailing: _pickedDate == null ? null : Text(_pickedDate.toString()),
          onTap: () async {
            final date = await showPersianDatePicker(
              context: context,
            );

            setState(() {
              _pickedDate = date;
            });
          },
        ),
      ],
    );
  }
}
