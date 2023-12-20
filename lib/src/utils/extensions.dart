extension DoubleToPigeon on double {
  String toPigeon() {
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

  DateTime? toDateTimeOrNull() {
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
}

extension NullableStringToPigeon on String? {
  bool? toBoolOrNull() {
    if (this == null) {
      return null;
    }

    return this!.toLowerCase() == 'true';
  }
}
