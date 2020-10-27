void main() {
  print(threeSumClosest(<int>[-3,-2,-5,3,-4], -1));
  print(threeSumClosest(<int>[-3,-2,-5,3,-4], -6));
  print(threeSumClosest(<int>[-3,-4, 5, 3, 4, 12, 4, 9, 0, -1, -2], -10));
}

int threeSumClosest(List<int> nums, int target) {
  if (nums.length < 3) return 0;

  nums.sort();

  double closest = double.maxFinite;
  int left = 0;

  while (left < nums.length - 2) {
    int mid = left + 1;
    int right = nums.length - 1;
    int l = nums[left];

    while (mid < right) {
      int m = nums[mid];
      int r = nums[right];

      int sum = l + m + r;
      if (sum == target) {
        print('[$l, $m, $r]');
        return target;
      } else if (sum > target) {
        final double newOne = compare(sum, target, closest);
        if (newOne != closest) {
          closest = newOne;
          print('[$l, $m, $r]');
        }
        right--;
      } else {
        final double newOne = compare(sum, target, closest);
        if (newOne != closest) {
          closest = newOne;
          print('[$l, $m, $r]');
        }
        mid++;
      }
    }
    left++;
  }
  return closest.toInt();
}

double compare(int sum, int target, double closest) {
  final double sumAbs = (sum - target).abs().toDouble();
  final double cloAbs = (closest - target).abs();
  if (cloAbs > sumAbs) {
    closest = sum.toDouble();
  }
  return closest;
}
