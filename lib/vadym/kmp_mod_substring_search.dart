void main() {
  /// modification -
  /// pattern should be located inside of merged string from list
  /// merge not allowed
  print(
    searchSubstring(
      <String>['abc', 'aaaaa', '1', '232', 'abcaaaabcabc', 'abc', 'abcaaabcd', 'abc', 'abbacdaaaa', 'aaaaa'],
      'abcabcabc',
    ),
  ); // 6
}

/// Time Complexity O(m + n), Space complexity O(n)
/// m - input, n - pattern length
bool searchSubstring(List<String> input, String pattern) {
  if (input.isEmpty || pattern.isEmpty) {
    return false;
  }
  /// table to build a pattern
  final List<int> patternTable = List<int>.filled(pattern.length, 0);

  int j = 0;
  int i = 1;
  final int patMaxIndex = pattern.length - 1;

  /// length of prefix which is suffix also
  /// Generate safe check positions for optimization
  /// It defines how much chars can be safely ignored (not checked again)
  /// while chars at current position not matched
  /// And return to position after safe prefix
  /// and check again with same char in the input
  while (i <= patMaxIndex) {
    if (pattern[i] == pattern[j]) {
      patternTable[i] = j + 1;
      j++;
      i++;
    } else if (j > 0) {
      j = patternTable[j - 1];
    } else {
      i += 1;
    }
  }

  int patIdx = 0; // for iteration over pattern;
  for (final String line in input) {
    int lineIdx = 0;
    while (lineIdx < line.length) {
      /// If it is last char in pattern - return start position of this pattern
      if (patIdx == pattern.length) {
        return true;
      }

      /// If chars match - iterate to the next
      if (line[lineIdx] == pattern[patIdx]) {
        patIdx++;
        lineIdx++;
      } else if (patIdx > 0) {
        /// if Value is not zero - means that we could return to pattern position
        /// safely ignore some prefix equal to suffix and check chars again
        patIdx = patternTable[patIdx - 1];
      } else {
        /// If value is zero - move to next char in line
        lineIdx++;
      }
    }
  }
  return false;
}
