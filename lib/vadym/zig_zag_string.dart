///  Input: s = "PAYPALISHIRING", numRows = 4
///  Output: "PINALSIGYAHRPI"
///  Explanation:
///
///  P     I    N
///  A   L S  I G
///  Y A   H R
///  P     I

void main() {
  print(convert('PAYPALISHIRING', 4));
}

String convert(String s, int numRows) {
  print(s);
  print(' ');

  if (numRows == 1) {
    return s;
  }

  final int size = s.length;
  final int cycleCount = numRows * 2 - 2;
  final StringBuffer result = StringBuffer();

  for (int i = 0; i < numRows; i++) {
    for (int j = 0; i + j < size; j += cycleCount) {
      // First and last rows will work the same. will add one char in a cycle
      // All other cycles will add this one and more
      result.write(s[j + i]);
      // This is a case when rows are in between
      if (i > 0 && i < numRows - 1 && j + cycleCount - i < size) {
        result.write(s[j + cycleCount - i]);
      }
    }
  }

  return result.toString();
}
