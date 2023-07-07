import 'package:intl/intl.dart';

extension DateExtension on DateTime? {
  String convertDateTimeToString({String fromPattern = "dd-MM-yyyy"}) {
    if (this != null) {
      String formattedDate = DateFormat(fromPattern).format(this!.toLocal());
      return formattedDate;
    }
    return '';
  }
}
