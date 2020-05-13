import 'dart:math';

void main() {
  final List<List<int>> array = <List<int>>[
    <int>[1, 2, 3, 4],
    <int>[10, 11, 12, 5],
    <int>[9, 8, 7, 6],
  ];

  print(spiralRead2dArray(array));

  final List<List<int>> array2 = <List<int>>[
    <int>[1, 2, 3],
    <int>[8, 9, 4],
    <int>[7, 6, 5],
  ];
  print(spiralRead2dArray(array2));

  final List<List<int>> array3 = <List<int>>[
    <int>[1, 2, 3, 4, 5, 6],
    <int>[12, 11, 10, 9, 8, 7],
  ];
  print(spiralRead2dArray(array3));

  final List<List<int>> array4 = <List<int>>[
    <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
  ];
  print(spiralRead2dArray(array4));
}

List<int> spiralRead2dArray(List<List<int>> array) {
  if (array == null) {
    return null;
  }
  if (array.length == 1) {
    return array[0];
  }

  final List<int> result = <int>[];
  // save position os rectangle borders:
  // saving as positions in arrays
  int startR = 0;
  int startC = 0;
  int endR = array.length - 1;
  int endC = array[0].length - 1;

  while (startR <= endR && startC <= endC) {
    for (int i = startC; i <= endC; i++) {
      result.add(array[startR][i]);
      if (startC == endC) {
        break;
      }
    }
    for (int i = startR + 1; i <= endR; i++) {
      result.add(array[i][endC]);
      if (startR == endR) {
        break;
      }
    }
    for (int i = endC - 1; i > startC; i--) {
      result.add(array[endR][i]);
    }
    for (int i = endR; i > startR; i--) {
      result.add(array[i][startC]);
    }

    startR++;
    endR--;
    startC++;
    endC--;
  }

  return result;
}
