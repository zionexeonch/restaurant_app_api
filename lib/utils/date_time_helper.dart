import 'package:intl/intl.dart';

class DateTimeHelper {
  static DateTime format() {
    // Date and Time Format
    final now = DateTime.now()
        .toUtc(); // Gunakan toUtc() untuk mengonversi ke waktu UTC
    final dateFormat = DateFormat('y/M/d');
    const timeSpecific = "11:00:00";
    final completeFormat = DateFormat('y/M/d H:m:s');

    // Today Format
    final todayDate = dateFormat.format(now);
    final todayDateAndTime = "$todayDate $timeSpecific";
    final resultToday = completeFormat.parseStrict(todayDateAndTime);

    // Tomorrow Format
    final formatted = resultToday.add(const Duration(days: 1));
    final tomorrowDate = dateFormat.format(formatted);
    final tomorrowDateAndTime = "$tomorrowDate $timeSpecific";
    final resultTomorrow = completeFormat.parseStrict(tomorrowDateAndTime);

    return now.isAfter(resultToday) ? resultTomorrow : resultToday;
  }
}
