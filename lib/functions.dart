import 'package:intl/intl.dart';

String solatDate(String solatDateOnly) {
  return DateFormat("d/M/y")
      .format(
        DateTime.parse(solatDateOnly),
      )
      .toString();
}

String solatTime(String solatDateOnly, String solatTimeOnly) {
  return DateFormat("h:mma")
      .format(
        DateTime.parse(solatDateOnly + ' ' + solatTimeOnly),
      )
      .toString();
}
