void main() {
  //print(searchSubstring('abdgggbvbvvaabcdaabaaaasssdfvv', 'aabcdaab')); // 11
  print(
    searchSubstring(
      'bacaacacabacaacacabacacabacacacacaba',
      'acacabacacabacacac',
    ),
  ); // 6
}

// Time Complexity O(m + n), Space complexity O(n)
// m - input, n - pattern length
int searchSubstring(String input, String pattern) {
  if (input.isEmpty || pattern.isEmpty) {
    return 0;
  }
  final List<int> positions = List<int>(pattern.length);
  int j = 0;
  int i = 1;
  final int patMaxIndex = pattern.length - 1;
  // length of prefix which is suffix also
  // Generate safe check positions for optimization
  // It defines how much chars can be safely ignored (not checked again)
  // while chars at current position not matched
  // And return to position after safe prefix
  // and check again with same char in the input
  positions[0] = 0;
  while (i <= patMaxIndex) {
    if (pattern[i] == pattern[j]) {
      positions[i] = j + 1;
      j++;
      i++;
    } else {
      positions[i] = 0;
      if (j == 0 && i == patMaxIndex) {
        break;
      }
      j = j > 0 ? positions[j - 1] : j;
      i = j > 0 ? i : (i == patMaxIndex ? i : i + 1);
    }
  }
  print(positions);

  j = 0; // for iteration over pattern;
  i = 0;
  while (i < input.length) {
    //    print('${input[i]} ${pattern[j]} $i $j ${positions[j]}');
    // If it is last char in pattern - return start position of this pattern
    if (j == pattern.length) {
      print(input.substring(i - j, i + 1));
      print('[${i - j}, $i]');
      return i - j;
    }
    // If chars match - iterate to the next
    if (input[i] == pattern[j]) {
      j++;
      i++;
    } else {
      // If value is zero - move to next char in input
      if (j == 0) {
        i++;
        continue;
      }
      // if Value is not zero - means that we could return to pattern position
      // safely ignore some prefix equal to suffix and check chars again
      j = j > 0 ? positions[j - 1] : j;
    }
  }
  return 0;
}
