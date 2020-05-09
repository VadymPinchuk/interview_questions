// File created by
// Lung Razvan <long1eu>
// on 09/05/2020

void main() {
  final List<dynamic> array = <dynamic>[
    5,
    2,
    <int>[7, -1],
    3,
    <dynamic>[
      6,
      <int>[-13, 8],
      4
    ]
  ];
  final int result = recursive(array, 1);
  print(result);
}

int recursive(List<dynamic> array, int level) {
  int sum = 0;
  for (int i = 0; i < array.length; i++) {
    final dynamic element = array[i];
    if (element is List) {
      sum += recursive(element, level + 1);
    } else {
      sum += element;
    }
  }
  return sum * level;
}
