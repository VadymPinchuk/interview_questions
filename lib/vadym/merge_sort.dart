/// Divide and conquer
/// Merge sort - split and merge
void main() {
  print(sortArray(<int>[
    3,
    8,
    2,
    1,
    3,
    5,
    7,
    90,
    67,
    45,
    23,
    76,
    23,
    12,
    -1,
    9,
    0,
    0,
    12,
    19,
    0,
    34,
    100,
    -23,
    -100,
    23,
    -98,
    -99,
  ]));
}

// O(n*log(n)) n - amount of items in list, log(n) - depth of graph
List<int> sortArray(List<int> nums) {
  if (nums.length <= 1) {
    return nums;
  }
  final int end = nums.length - 1;
  final int mid = end ~/ 2;

  final List<int> left = sortArray(nums.sublist(0, mid + 1));
  final List<int> right = sortArray(nums.sublist(mid + 1, end + 1));

  return mergeArrays(left, right);
}

List<int> mergeArrays(List<int> left, List<int> right) {
  print('merge $left $right');
  final List<int> result = <int>[];
  int leftP = 0;
  int rightP = 0;
  while (leftP < left.length && rightP < right.length) {
    if (left[leftP] < right[rightP]) {
      result.add(left[leftP]);
      leftP++;
    } else {
      result.add(right[rightP]);
      rightP++;
    }
  }

  while (rightP < right.length) {
    result.add(right[rightP]);
    rightP++;
  }

  while (leftP < left.length) {
    result.add(left[leftP]);
    leftP++;
  }
  return result;
}
