void main() {
  print(multiply('123', '456'));
  print(multiply('123456789', '987654321'));
  print(multiply('12345678987654321', '98765432123456789'));
}

String multiply(String num1, String num2) {
  if (num1 == null || num2 == null) {
    return null;
  }
  if (num1.isEmpty || num2.isEmpty) {
    return '';
  }

  if (num1 == '0' || num2 == '0') {
    return '0';
  }

  final int last1 = num1.length - 1;
  final int last2 = num2.length - 1;

  // Array of single digits < 10 reverse presentation of string
  final List<int> digits = List<int>(last1 + last2 + 2);

  for (int i = last1; i >= 0; i--) {
    // ASCII code of char - 48 = to actual digit
    final int charAt1 = num1.codeUnitAt(i) - 48;
    int reminder = 0;

    for (int j = last2; j >= 0; j--) {
      final int digitIndex = last1 + last2 - i - j;
      // ASCII code of char - 48 = to actual digit
      final int charAt2 = num2.codeUnitAt(j) - 48;
      final int multiply = charAt1 * charAt2 + (digits[digitIndex] ?? 0);
      reminder = multiply ~/ 10;
      final int digit = multiply % 10;
      digits[digitIndex] = digit;
      if (reminder != 0) {
        digits[digitIndex + 1] = (digits[digitIndex + 1] ?? 0) + reminder;
      }
      reminder = 0;
    }
  }

  final StringBuffer result = StringBuffer();
  result.write('$num1 x $num2 = ');

  for (int d = digits.length - 1; d >= 0; d--) {
    if (digits[d] == null) {
      continue;
    }
    result.write(digits[d]);
  }

  return result.toString();
}
