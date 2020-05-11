void main() {
  print(getSmallestDiffOfTwo(
    <int>[2, 45, 34, 21, -1, -10, -234, 23, 69, 96],
    <int>[-300, -15, 0, 1, -45, 76, 100, 89, 456],
  ));
}

// Time: O(N*log(N) + M*log(M)) - because of sorting
// Space: O(1)
List<int> getSmallestDiffOfTwo(List<int> one, List<int> two) {
  one.sort();
  two.sort();

  double smallestDiff = double.maxFinite;
  int pointer1 = 0;
  int pointer2 = 0;

  int valueOne = 0;
  int valueTwo = 0;

  while (pointer1 < one.length && pointer2 < two.length) {
    final int val1 = one[pointer1];
    final int val2 = two[pointer2];

    int diff;
    if (val1 == val2) {
      return <int>[val1, val2];
    } else if (val1 < val2) {
      diff = val2 - val1;
      pointer1++;
    } else {
      diff = val1 - val2;
      pointer2++;
    }

    if (smallestDiff > diff) {
      smallestDiff = diff.toDouble();
      valueOne = val1;
      valueTwo = val2;
    }
  }
  return <int>[valueOne, valueTwo];
}
