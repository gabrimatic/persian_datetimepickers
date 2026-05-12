import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persian_datetimepickers/persian_datetimepickers.dart';

void main() {
  group('DateTime extensions', () {
    test('format Persian date with leading zeroes', () {
      expect(DateTime(2022, 2, 5).toPersianDate(), '1400/11/16');
    });

    test('format Gregorian date as a readable string', () {
      expect(
        DateTime(2024, 2, 29).toFancyString(isJalali: false),
        'Thursday, 29 February 2024',
      );
    });
  });

  group('TimeOfDay extensions', () {
    test('format midnight with leading zeroes', () {
      expect(const TimeOfDay(hour: 0, minute: 5).toFancyString(), '00:05');
    });
  });

  group('String extensions', () {
    test('add leading zero to one-character values', () {
      expect('7'.addExtraZero, '07');
      expect('12'.addExtraZero, '12');
    });
  });
}
