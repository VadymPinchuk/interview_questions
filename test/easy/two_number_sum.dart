// File created by
// Lung Razvan <long1eu>
// on 03/05/2020

import 'package:interview_question/easy/two_number_sum.dart';
import 'package:test/test.dart';

final List<List<int>> arrays = <List<int>>[
  <int>[3, 5, -4, 8, 11, 1, -1, 6],
  <int>[4, 6],
  <int>[4, 6, 1],
  <int>[4, 6, 1, -3],
  <int>[1, 2, 3, 4, 5, 6, 7, 8, 9],
  <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 15],
  <int>[-7, -5, -3, -1, 0, 1, 3, 5, 7],
  <int>[-21, 301, 12, 4, 65, 56, 210, 356, 9, -47],
  <int>[-21, 301, 12, 4, 65, 56, 210, 356, 9, -47],
  <int>[3, 5, -4, 8, 11, 1, -1, 6],
];

final List<int> sums = <int>[10, 10, 5, 3, 17, 18, -5, 163, 164, 15];

void main() {
  test('solution1', () {
    for (int i = 0; i < arrays.length; i++) {
      print('test case ${i + 1}');
      final List<int> result = twoNumberSum1(arrays[i], sums[i]);

      if (result.isNotEmpty) {
        expect(result.reduce((int value, int element) => value + element), sums[i]);
      }
    }
  });

  test('solution2', () {
    for (int i = 0; i < arrays.length; i++) {
      print('test case ${i + 1}');
      final List<int> result = twoNumberSum2(arrays[i], sums[i]);

      if (result.isNotEmpty) {
        expect(result.reduce((int value, int element) => value + element), sums[i]);
      }
    }
  });

  test('solution3', () {
    for (int i = 0; i < arrays.length; i++) {
      print('test case ${i + 1}');
      final List<int> result = twoNumberSum3(arrays[i], sums[i]);

      if (result.isNotEmpty) {
        expect(result.reduce((int value, int element) => value + element), sums[i]);
      }
    }
  });
}
