import 'dart:math';

void main() {
  print(findMedianSortedArrays(
    <double>[2, 5, 7, 9, 23, 45, 67, 88],
    <double>[-10, -3, -1, 0, 12, 44, 55, 56],
  ));
}

double findMedianSortedArrays(List<double> nums1, List<double> nums2) {
  if (nums1 == null || nums2 == null) return 0.0;

  int size1 = nums1.length;
  int size2 = nums2.length;

  if (size1 == 0) return oneArrayMedian(nums2);
  if (size2 == 0) return oneArrayMedian(nums1);

  if (size1 > size2) return findMedianSortedArrays(nums2, nums1);

  // pos1+pos2 = (x+y+1)/2
  int start = 0;
  int end = size1;
  while (start <= end) {
    // positions of second half start
    final int pos1 = (start + end) ~/ 2;
    final int pos2 = (size1 + size2 + 1) ~/ 2 - pos1;
    // condition check
    final double left1 = pos1 == 0 ? double.negativeInfinity : nums1[pos1 - 1];
    final double right1 = pos1 == size1 ? double.infinity : nums1[pos1];

    final double left2 = pos2 == 0 ? double.negativeInfinity : nums2[pos2 - 1];
    final double right2 = pos2 == size2 ? double.infinity : nums2[pos2];

    if ((left1 <= right2) && (left2 <= right1)) {
      // if total size is odd
      if ((size1 + size2) % 2 == 0) {
        print('[$left1 | $right1] & [$left2 | $right2]');
        return (max(left1, left2) + min(right1, right2)) / 2;
      } else {
        print('[$left1 | $left2]');
        // if total size is even
        return max(left1, left2);
      }
    } else if (left1 > right2) {
      end = pos1 - 1;
    } else if (left2 > right1) {
      start = pos1 + 1;
    }
  }
  return 0;
}

double oneArrayMedian(List<double> array) {
  // isEven - take average of two in the middle
  final int size = array.length;
  if (size % 2 == 0) {
    final int mid = size ~/ 2;
    return (array[mid - 1] + array[mid]) / 2;
  } else {
    // if Odd - just one in the middle
    return array[size ~/ 2];
  }
}
