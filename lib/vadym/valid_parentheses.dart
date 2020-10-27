void main() {
  print(isValid('(){}[]'));
  print(isValid('({})[]'));
  print(isValid('()[{}]'));
  print(isValid('({[]})'));
  print(isValid('()[{]}'));
  print(isValid('([){]}'));
  print(isValid('([{]}'));
  print(isValid('([{]}'));
  print(isValid('}{'));
}

bool isValid(String s) {
  print(s);
  if (s.length % 2 == 1) {
    return false;
  }

  final List<int> chars = <int>[];
  int lastIndex = -1;
  for (final int next in s.codeUnits) {
    if (isOpening(next)) {
      chars.add(next);
      lastIndex++;
    } else {
      if (chars.isEmpty) {
        return false;
      } else {
        final int prev = chars[lastIndex];
        if (isPair(prev, next)) {
          chars.removeAt(lastIndex);
          lastIndex--;
        } else if (isOpening(prev)) {
          return false;
        } else {
          chars.add(next);
          lastIndex++;
        }
      }
    }
  }
  return lastIndex == -1;
}

final int open1 = '('.codeUnits.first;
final int open2 = '{'.codeUnits.first;
final int open3 = '['.codeUnits.first;
final int close1 = ')'.codeUnits.first;
final int close2 = '}'.codeUnits.first;
final int close3 = ']'.codeUnits.first;

bool isPair(int first, int second) =>
    first == open1 && second == close1 ||
    first == open2 && second == close2 ||
    first == open3 && second == close3;

bool isOpening(int brackets) =>
    brackets == open1 || brackets == open2 || brackets == open3;

bool isClosing(int brackets) =>
    brackets == close1 || brackets == close2 || brackets == close3;
