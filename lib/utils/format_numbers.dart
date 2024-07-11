// Function to add commas to numbers
import 'package:intl/intl.dart';

String addCommas(double number) {
  final formatter = NumberFormat('#,##0.00'); // Adjust the pattern to include decimal points
  return formatter.format(number);
}