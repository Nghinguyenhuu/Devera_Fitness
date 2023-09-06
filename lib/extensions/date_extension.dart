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

extension DurationExtension on Duration? {
  String formatDurationInMmSs() {
    String mm = '';
    String ss = '';
    if (this != null) {
      mm = (this!.inMinutes % 60).toString().padLeft(2, '0');
      ss = (this!.inSeconds % 60).toString().padLeft(2, '0');
    }
    return '$mm:$ss';
  }
}
