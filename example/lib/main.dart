import 'package:flutter/material.dart';
import 'package:persian_datetimepickers/persian_datetimepickers.dart';

void main() {
  runApp(
    MaterialApp(
      home: const PersianDatePickersExample(),
      debugShowCheckedModeBanner: false,
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
    return Scaffold(
      appBar: AppBar(title: Text('Pickers')),
      body: Column(
        children: <Widget>[
          ListTile(
            title: _pickedTime == null
                ? Text('Pick a time')
                : Text('Picked time:'),
            trailing:
                _pickedTime == null ? null : Text(_pickedTime!.toFancyString()),
            onTap: () async {
              final TimeOfDay? time = await showPersianTimePicker(
                context: context,
              );

              setState(() {
                _pickedTime = time;
              });
            },
          ),
          const SizedBox(height: 16),
          ListTile(
            title: _pickedDate == null
                ? Text('Pick a date')
                : Text('Picked date:'),
            trailing: _pickedDate == null
                ? null
                : Text(
                    _pickedDate!.toFancyString(),
                  ),
            onTap: () async {
              final DateTime? date = await showPersianDatePicker(
                context: context,
                color: Colors.red,
              );

              setState(() {
                _pickedDate = date;
              });
            },
          ),
        ],
      ),
    );
  }
}
