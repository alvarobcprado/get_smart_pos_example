import 'package:intl/intl.dart';

extension DoubleToPigeon on double {
  String toPigeonCurrency() {
    final totalCents = double.parse(toStringAsFixed(2)) * 100;

    final totalCentsString = totalCents.toStringAsFixed(0).padLeft(12, '0');

    return totalCentsString;
  }
}

extension StringFromPigeon on String {
  double toCurrency() {
    if (isEmpty) {
      return 0.0;
    }

    final totalCents = int.parse(this);

    final totalCurrency = double.parse((totalCents / 100).toStringAsFixed(2));

    return totalCurrency;
  }

  int? toIntOrNull() {
    return int.tryParse(this);
  }

  /// Converts a string in the format `MMDDhhmmss` to a DateTime object.
  DateTime? toGMTDateTimeOrNull() {
    if (isEmpty || length != 10) {
      return null;
    }

    final month = int.parse(substring(0, 2));
    final day = int.parse(substring(2, 4));
    final hour = int.parse(substring(4, 6));
    final minute = int.parse(substring(6, 8));
    final second = int.parse(substring(8, 10));

    final now = DateTime.now();
    return DateTime(now.year, month, day, hour, minute, second);
  }

  /// Converts a string in the format `ddMMyyyy` to a DateTime object.
  DateTime? toDateTimeOrNull() {
    if (isEmpty || length != 8) {
      return null;
    }

    final formatter = DateFormat('ddMMyyyy');
    return formatter.tryParse(this);
  }

  bool toBool() {
    return toLowerCase() == 'true';
  }
}

extension DateTimeToPigeon on DateTime {
  /// Converts a DateTime object to a string in the format dd/MM/yyyy.
  String? toFormattedString() {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }
}
