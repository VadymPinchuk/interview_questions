import 'dart:collection';

import 'package:interview_question/middle/bst_construction.dart';

void main() {
  final BST bst = BST(10)
      .insert(18)
      .insert(15)
      .insert(13)
      .insert(11)
      .insert(14)
      .insert(16)
      .insert(17)
      .insert(5)
      .insert(5)
      .insert(8)
      .insert(9)
      .insert(6)
      .insert(2)
      .insert(1)
      .insert(11);

  BTreePrinter.printNode(bst.root);
  print(breadthFirstSearch(bst.root));
}

List<int> breadthFirstSearch(Node node) {
  final Queue<Node> queue = Queue<Node>();
  final List<int> values = <int>[];
  queue.add(node);
  while (queue.isNotEmpty) {
    final Node current = queue.first;
    if (current.left != null) {
      queue.add(current.left);
    }
    if (current.right != null) {
      queue.add(current.right);
    }
    values.add(current.value);
    queue.removeFirst();
  }
  return values;
}
