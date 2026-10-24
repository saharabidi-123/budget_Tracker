const String currency = 'DT'; // change to €, $, etc.

String formatMoney(double amount) => '${amount.toStringAsFixed(2)} $currency';

String formatDate(DateTime date) {
  final day = date.day.toString().padLeft(2, '0');
  final month = date.month.toString().padLeft(2, '0');
  return '$day/$month/${date.year}';
}