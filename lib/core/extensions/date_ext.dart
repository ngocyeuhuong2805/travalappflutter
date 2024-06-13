import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get getStartDate {
    DateFormat format = DateFormat('dd MMM');
    return format.format(this);
  }

  String get getEndDate {
    DateFormat format = DateFormat('dd MMM yyyy');
    return format.format(this);
  }
}
