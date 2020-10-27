void main() {
  print(intToRoman(1989));
  print(intToRoman(1111));
  print(intToRoman(3999));
  print(intToRoman(152));
  print(intToRoman(2345));
  print(intToRoman(1988));
  print(intToRoman(4000));
}

String intToRoman(int num) {
  if (num == 4000) {
    return 'M';
  }

  if (num == 0 || num > 4000) {
    return '';
  }

  int inc = 1000;
  final StringBuffer res = StringBuffer();
  while (inc >= 1) {
    final int digit = num ~/ inc % 10;
    insertion(inc, digit, res);
    inc = inc ~/ 10;
  }
  return res.toString();
}

void insertion(int inc, int digit, StringBuffer res) {
  if (digit < 4) {
    for (int i = 0; i < digit; i++) {
      res.write(inc < 10 ? 'I' : (inc < 100 ? 'X' : (inc < 1000 ? 'C' : 'M')));
    }
  } else if (digit == 4) {
    res.write(inc < 10 ? 'IV' : (inc < 100 ? 'XL' : 'CD'));
  } else if (digit < 9) {
    res.write(inc < 10 ? 'V' : (inc < 100 ? 'L' : 'D'));
    for (int i = 0; i < digit % 5; i++) {
      res.write(inc < 10 ? 'I' : (inc < 100 ? 'X' : (inc < 1000 ? 'C' : 'M')));
    }
  } else if (digit == 9) {
    res.write(inc < 10 ? 'IX' : (inc < 100 ? 'XC' : 'CM'));
  }
}
