void main() {
  /// partial list reverse. from index to index
  void reverse(final List<int> nums, int start, int end) {
    while (start < end) {
      int tmp = nums[start];
      nums[start] = nums[end];
      nums[end] = tmp;
      start++;
      end--;
    }
  }

  /// Find next bigger permutation of list
  /// If it is not possible - sort list
  List<int> nextPermutation(List<int> nums) {
    if (nums.length <= 1) {
      return nums;
    }
    if (nums.length > 1) {
      /// iterate from end to start
      for (int i = nums.length - 1; i > 0; i--) {
        /// first decreasing number, comparing to previous
        if (nums[i] > nums[i - 1]) {
          final int number = nums[i - 1];
          int index = i;

          /// swap with smallest bigger that this number 4 and 5 for example
          while (index < nums.length) {
            /// condition of next item smaller or equal than decreasing
            bool condition =
                index < nums.length - 1 ? nums[index + 1] <= number : true;
            if (nums[index] > number && condition) {
              nums[i - 1] = nums[index];
              nums[index] = number;
              break;
            }
            index++;
          }

          /// reverse part of array
          reverse(nums, i, nums.length - 1);

          break;
        }
        if (i == 1) {
          nums.sort();
        }
      }
    }
    return nums;
  }

  print('[1, 2, 5] -> ${nextPermutation(<int>[1, 2, 5])}');
  print(nextPermutation(<int>[3, 1, 2]));
  print(nextPermutation(<int>[3, 2, 1]));
  print(nextPermutation(<int>[1, 3, 5, 7, 4, 9, 8, 7, 6, 5, 4]));
}
