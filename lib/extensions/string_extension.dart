import 'package:intl/intl.dart';

extension StringExtension on String? {
  String? covertToAppDateTime({
    String fromPattern = "yyyy-MM-dd HH:mm:ss.SSS",
    String toPattern = 'dd/MM/yyyy',
  }) {
    if (this != null && this!.isNotEmpty && this != '') {
      DateTime inputDate = DateFormat(fromPattern).parse(this!);
      var outputFormat = DateFormat(toPattern);
      var outputDate = outputFormat.format(inputDate);
      return outputDate;
    }
    return null;
  }

  DateTime? convertToDateTime({
    String fromPattern = "yyyy-MM-dd HH:mm:ss.SSS",
  }) {
    if (this != null) {
      return DateFormat(fromPattern).parse(this!);
    }
    return null;
  }
}
