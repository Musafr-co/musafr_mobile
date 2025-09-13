import 'package:intl/intl.dart';


String formatDate(DateTime date) {
  // Get the day number
  int day = date.day;

  // Determine ordinal suffix
  String suffix;
  if (day >= 11 && day <= 13) {
    suffix = "th";
  } else {
    switch (day % 10) {
      case 1:
        suffix = "st";
        break;
      case 2:
        suffix = "nd";
        break;
      case 3:
        suffix = "rd";
        break;
      default:
        suffix = "th";
    }
  }

  // Format month + year using intl
  String monthYear = DateFormat("MMM yyyy").format(date);

  return "$day$suffix $monthYear";
}

