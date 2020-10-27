void main() {
  final List<String> all = <String>[];

  void generateNext(int lCount, int rCount, String result, int max) {
    if (lCount == max && rCount == max) {
      all.add(result);
      return;
    }
    if (lCount < max) {
      generateNext(lCount + 1, rCount, '$result{', max);
    }
    if (rCount < lCount) {
      generateNext(lCount, rCount + 1, '$result}', max);
    }
  }

  List<String> allCombinations(int n) {
    generateNext(0, 0, '', n);
    return all;
  }

  print(allCombinations(5));
}
