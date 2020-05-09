// File created by
// Lung Razvan <long1eu>
// on 07/05/2020

void main() {
  final List<int> list = <int>[1, 10, 8, 5, 2, 9, 5, 6, 3];

  for (int i = 0; i < list.length - 1; i++) {
    int smallest = i;
    for (int j = i + 1; j < list.length; j++) {
      if (list[smallest] > list[j]) {
        smallest = j;
      }
    }

    final int tmp = list[i];
    list[i] = list[smallest];
    list[smallest] = tmp;
  }

  print(list);
}
