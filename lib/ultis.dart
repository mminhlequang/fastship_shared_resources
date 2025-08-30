part of 'shared_resources.dart';

double getCurrencyValue(String value) {
  var amount = 0.0;
  final cleanedText = value.replaceAll(RegExp(r'[^\d.]'), '');
  if (cleanedText.isNotEmpty) {
    amount = double.parse(cleanedText);
  }
  return amount;
}

List<TextInputFormatter> get currencyTextInputFormatter => [
  CurrencyTextInputFormatter.currency(
    locale: 'hu_HU',
    symbol: "Ft",
    enableNegative: false,
    decimalDigits: 0,
  ),
];

String currencyFormatted(num? amount, {decimalDigits}) {
  return NumberFormat.currency(
    locale: 'hu_HU',
    symbol: "Ft",
    decimalDigits: decimalDigits ?? 0,
  ).format(amount ?? 0);
}

double currencyFromEditController(TextEditingController controller) {
  final cleanedText = controller.text.replaceAll(RegExp(r'[^\d.]'), '');
  if (cleanedText.isNotEmpty) {
    final amount = double.tryParse(cleanedText) ?? 0;
    return amount;
  }
  return 0;
}
