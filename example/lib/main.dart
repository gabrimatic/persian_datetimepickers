import 'package:flutter/material.dart';
import 'package:persian_datetimepickers/persian_datetimepickers.dart';

void main() {
  final themeData = ThemeData();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
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
  const PersianDatePickersExample({super.key});

  @override
  State<PersianDatePickersExample> createState() =>
      _PersianDatePickersExampleState();
}

class _PersianDatePickersExampleState extends State<PersianDatePickersExample> {
  TimeOfDay? _pickedTime;
  DateTime? _pickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Persian datetime pickers')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Card(
            child: ListTile(
              title: const Text('Pick a time'),
              subtitle: Text(_pickedTime?.toFancyString() ?? 'No time picked'),
              onTap: () async {
                final time = await showPersianTimePicker(
                  context: context,
                  initialTime: _pickedTime,
                );

                if (time != null) {
                  setState(() => _pickedTime = time);
                }
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Pick a Jalali date'),
              subtitle: Text(
                _pickedDate?.toFancyString() ?? 'No date picked',
              ),
              onTap: () async {
                final date = await showPersianDatePicker(
                  context: context,
                  initialDate: _pickedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2035, 12, 31),
                );

                if (date != null) {
                  setState(() => _pickedDate = date);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
