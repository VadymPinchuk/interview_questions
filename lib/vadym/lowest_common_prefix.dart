void main() {
  print(longestCommonPrefix(<String>['dog', 'dogger', 'done']));
  print(longestCommonPrefix(<String>['good', 'god', 'gogo']));
  print(longestCommonPrefix(<String>['soul', 'money', 'health']));
  print(longestCommonPrefix(<String>['abcd', 'abv', 'aab']));
}

String longestCommonPrefix(List<String> strs) {
  if (strs.isEmpty) {
    return '';
  }
  if (strs.length == 1) {
    return strs[0];
  }

  String prefix;
  for (final String each in strs) {
    if (prefix == null) {
      prefix = each;
      continue;
    }
    int match = 0;
    for (final int letter in each.codeUnits) {
      if (match >= prefix.length || letter != prefix.codeUnitAt(match)) {
        break;
      } else {
        match++;
      }
    }
    if (match == 0) {
      return '';
    }
    prefix = prefix.substring(0, match);
    if (prefix.isEmpty) {
      return '';
    }
  }
  return prefix;
}
