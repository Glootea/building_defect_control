extension DateTimeFormatter on DateTime {
  String toShortDateString() {
    return '${day.toString().padLeft(2, '0')}.'
        '${month.toString().padLeft(2, '0')}.'
        '$year';
  }

  String toShortTimeString() {
    return '${hour.toString().padLeft(2, '0')}:'
        '${minute.toString().padLeft(2, '0')}';
  }
}
