import 'package:easy_localization/easy_localization.dart';

final indianRupeesFormat = NumberFormat.currency(
  name: "INR",
  locale: 'en_IN',
  decimalDigits: 0, // change it to get decimal places
  symbol: '₹ ',
);

extension StringExtension on String {
  String toCapitalize() {
    try {
      if (isEmpty) return this;
      return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
    } catch (e) {
      return this;
    }
  }
}

extension RupeesFormatter on int {
  String inRupeesFormat() {
    return indianRupeesFormat.format(this);
  }
}
