import 'dart:collection';
import 'dart:math';

void main() {
  print(
    lengthOfLongestSubstring('abcabcbb'),
  );
  print(
    lengthOfLongestSubstring('abcdefabcdefqwertyuiopasdfghjklzxcvbnmabcbb'),
  );
}

/// O(n) time and space
int lengthOfLongestSubstring(String s) {
  if (s == null || s.isEmpty) {
    return 0;
  }
  if (s.length == 1) {
    return 1;
  }

  int maxSize = 0;
  List<int> charsList = <int>[];
  for (final int symbol in s.codeUnits) {
    if (charsList.contains(symbol)) {
      final int listLength = charsList.length;
      maxSize = max(listLength, maxSize);
      final int charIndex = charsList.indexOf(symbol);

      // if char is far from end of list - remove char and all before it.
      // All chars after it - is a beginning of new list + new char
      // [a, b, c, d] + b => removed [a, b] and new one is [c, d] + b
      if (charsList.length - charIndex > 1) {
        charsList = charsList.sublist(charIndex + 1, charsList.length);
      } else {
        // if char is last - clear all list and fill with new data
        charsList.clear();
      }
      // add new char to list
      charsList.add(symbol);
    } else {
      charsList.add(symbol);
    }
  }
  if (charsList.length > maxSize) {
    maxSize = charsList.length;
  }
  return maxSize;
}
