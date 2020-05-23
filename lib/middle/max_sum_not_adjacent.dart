import 'dart:math';

/// find max sum of non adjacent items in array
void main() {
  maxNonAdjacent(<int>[12, 8, 7, 9, 12, 14, 23, 19, 14, 10]);
}

int maxNonAdjacent(List<int> list) {
  if (list.isEmpty) {
    return 0;
  }
  if (list.length == 1) {
    return list[0];
  }
  int second = list[0];
  int first = max(second, list[1]);
  for (int i = 2; i < list.length; i++) {
    final int current = max(second + list[i], first);
    second = first;
    first = current;
    print(first);
  }
  return first;
}
