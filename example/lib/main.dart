import 'package:flutter/material.dart';
import 'package:persian_datetimepickers/persian_datetimepickers.dart';

void main() {
  ThemeData themeData = ThemeData();

  runApp(
    MaterialApp(
      home: const PersianDatePickersExample(),
      theme: themeData.copyWith(
        colorScheme: themeData.colorScheme.copyWith(
          secondary: Colors.purple,
        ),
      ),
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
                ? const Text('Pick a time')
                : const Text('Picked time:'),
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
                ? const Text('Pick a date')
                : const Text('Picked date:'),
            trailing: _pickedDate == null
                ? null
                : Text(
                    _pickedDate!.toFancyString(),
                  ),
            onTap: () async {
              final DateTime? date = await showPersianDatePicker(
                context: context,
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
