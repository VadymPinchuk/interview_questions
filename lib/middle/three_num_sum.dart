void main() {
//  final List<int> input = <int>[12, 3, 1, 2, -6, 5, -8, 6];
//  const int target = 0;

  final List<int> input = <int>[12, 3, 1, 2, -6, 5, 0, -8, -1, 6, -5];
  const int target = -5;

  print(searchSum(input, target));
}

// O(n^2) because of two loops.
// O(n^2) in worst case at sorting, in avg - O(n*log(n))
List<dynamic> searchSum(List<int> input, int target) {
  if (input.length < 3) {
    return <dynamic>[];
  }
  final List<dynamic> result = <dynamic>[];
  // O(n^2) in worst case
  input.sort();
  // left and right positions for check
  int left = 0;
  // i is middle to be shifted
  while (left < input.length - 2) {
    int right = input.length - 1;
    for (int i = left + 1; i < input.length - 1;) {
      if (i < right) {
        int leftV = input[left];
        int midV = input[i];
        int rightV = input[right];
        int sum = leftV + midV + rightV;
        print('$left $i $right = $sum');
        if (sum == target) {
          result.add(<int>[leftV, midV, rightV]);
          i++;
        } else if (sum > target) {
          right--;
        } else {
          i++;
        }
      } else {
        break;
      }
      // else mid - incremented. i++
    }
    left++;
  }
  return result;
}
