import 'dart:collection';

void main() {
  print(combinationSum(<int>[2, 3, 5], 8));
}

List<List<int>> combinationSum(List<int> nums, int target) {
  if (nums == null || nums.isEmpty) {
    return null;
  }

  /// Sort, to iterate from smallest nums
  nums.sort();
  final Set<List<int>> results = HashSet<List<int>>();

  /// Declare recursive method to check if target archived
  void checkNextNum(int index, List<int> selected, int difference) {
    /// if difference is 0 - target archived on prev index
    if (difference == 0) {
      results.add(selected);
      return;
    }

    /// for each index including current (as it is possible to have [0,0,0,0]
    for (int j = index; j < nums.length; j++) {
      /// if diff is smaller than item at index -
      /// need to interrupt as next diff cant be negative
      if (nums[j] > difference) {
        return;
      }

      /// in other case check same condition starting from the same index;
      final List<int> nexList = <int>[...selected, nums[j]];
      checkNextNum(j, nexList, difference - nums[j]);
    }
  }

  /// For each index check for possible combinations.
  /// Check will include the same index check if: difference > 0
  int index = 0;
  while (index < nums.length) {
    checkNextNum(index, <int>[], target);
    index++;
  }

  return results.toList();
}
