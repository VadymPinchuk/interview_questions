// File created by
// Lung Razvan <long1eu>
// on 03/05/2020

List<int> twoNumberSum1(List<int> array, int targetSum) {
  for (int i = 0; i < array.length - 1; i++) {
    for (int j = i + 1; j < array.length; j++) {
      if (array[i] + array[j] == targetSum) {
        return <int>[array[i], array[j]];
      }
    }
  }
  return <int>[];
}

List<int> twoNumberSum2(List<int> array, int targetSum) {
  final Map<int, bool> map = <int, bool>{};
  for (int i = 0; i < array.length; i++) {
    final int j = targetSum - array[i];
    if (map[j] != null) {
      return <int>[array[i], j];
    } else {
      map[j] = true;
    }
  }
  return <int>[];
}

List<int> twoNumberSum3(List<int> array, int targetSum) {
  array.sort();
  int left = 0;
  int right = array.length - 1;
  while (left < right) {
    final int sum = array[left] + array[right];
    if (sum == targetSum) {
      return <int>[array[left], array[right]];
    } else if (sum < targetSum) {
      left++;
    } else {
      right--;
    }
  }
  return <int> [];
}
