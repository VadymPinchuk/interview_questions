void main() {
  insertionSort(<int>[2, 4, 7, 1, 6, 8, 2, 3, 5]);
}

void insertionSort(List<int> list) {
  print(list);
  int sorted = 0;
  while (sorted < list.length - 1) {
    for (int i = sorted; i >= 0; i--) {
      if (list[i] > list[i + 1]) {
        int tmp = list[i];
        list[i] = list[i + 1];
        list[i + 1] = tmp;
      }
    }
    sorted++;
  }
  print(list);
}
