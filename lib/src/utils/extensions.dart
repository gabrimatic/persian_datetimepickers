import 'package:shamsi_date/shamsi_date.dart';

extension PersianTimeDatePickerExtention on DateTime {
  String toPersianDate() {
    final date = Jalali.fromDateTime(this);
    return '${date.year}/${date.month}/${date.day}';
  }
}
