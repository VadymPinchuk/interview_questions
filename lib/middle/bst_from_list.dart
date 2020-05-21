import 'package:interview_question/middle/bst_construction.dart';


/// Build BST from sorted list of distinct integers
void main() {
  BTreePrinter.printNode(
    createBST(
      <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    ),
  );
}

Node createBST(List<int> values) {
  if (values.isEmpty) {
    return null;
  }
  const int left = 0;
  final int right = values.length - 1;
  final int mid = (left + right) ~/ 2;
  final Node node = Node(values[mid]);
  if (left < right) {
    node.left = createBST(values.sublist(left, mid));
    node.right = createBST(values.sublist(mid + 1, right + 1));
  }
  return node;
}
