import 'package:intl/intl.dart';

extension DateExtension on DateTime? {
  String convertDateTimeToString({String fromPattern = "yyyy-MM-dd HH:mm:ss.SSS"}) {
    if (this != null) {
      String formattedDate = DateFormat(fromPattern).format(this!.toLocal());
      return formattedDate;
    }
    return '';
  }
}
