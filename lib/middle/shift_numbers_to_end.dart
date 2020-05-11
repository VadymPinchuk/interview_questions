import 'dart:math';

void main() {
  print(shiftNumbersToEnd(<int>[-1, 0, 3, 2, 2, 3, 2, 1, 4, 5, 0, 2, 1, 1], 2));
}

// Shift nums to the end of array
// Time: O(N) in worst case
// Space: O(1)
List<int> shiftNumbersToEnd(List<int> array, int num) {
  print(array);
  int counter = 0;
  int start = 0;
  int end = array.length - 1;
  while (start < end) {
    if (array[end] == num) {
      end--;
      continue;
    }
    if (array[start] != num) {
      start++;
      continue;
    } else {
      array[start] = array[end];
      array[end] = num;
      counter++;
      start++;
      end--;
    }
  }
  print(counter);
  return array;
}
