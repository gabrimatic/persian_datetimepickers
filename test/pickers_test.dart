import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persian_datetimepickers/persian_datetimepickers.dart';

void main() {
  testWidgets('time picker accepts midnight as an initial value',
      (tester) async {
    TimeOfDay? picked;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () async {
              picked = await showPersianTimePicker(
                context: context,
                initialTime: const TimeOfDay(hour: 0, minute: 5),
                isJalali: false,
              );
            },
            child: const Text('Open'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(picked, const TimeOfDay(hour: 0, minute: 5));
  });

  testWidgets('date picker returns Gregorian leap day inside range',
      (tester) async {
    DateTime? picked;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () async {
              picked = await showPersianDatePicker(
                context: context,
                initialDate: DateTime(2024, 2, 29),
                firstDate: DateTime(2024, 2, 28),
                lastDate: DateTime(2024, 2, 29),
                isJalali: false,
              );
            },
            child: const Text('Open'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(picked, DateTime(2024, 2, 29));
  });

  testWidgets('date picker rejects reversed ranges', (tester) async {
    late BuildContext pickerContext;

    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            pickerContext = context;
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    await expectLater(
      showPersianDatePicker(
        context: pickerContext,
        firstDate: DateTime(2025),
        lastDate: DateTime(2024),
      ),
      throwsArgumentError,
    );
  });
}
