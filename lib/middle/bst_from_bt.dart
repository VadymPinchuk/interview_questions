import 'package:interview_question/middle/bst_construction.dart';

import 'bst_from_list.dart';

void main() {
  final BST bst = BST(10)
      .insert(9)
      .insert(8)
      .insert(7)
      .insert(16)
      .insert(15)
      .insert(17)
      .insert(20)
      .insert(19)
      .insert(21);
  BTreePrinter.printNode(bst.root);

  BTreePrinter.printNode(balanceBST(bst.root));
}

/// O(n) time and space
void readBT(Node root, List<int> values) {
  values.add(root.value);
  if (root.left != null) {
    readBT(root.left, values);
  }
  if (root.right != null) {
    readBT(root.right, values);
  }
}
/// O(n*log(n)) time and O(n) space
Node balanceBST(Node root) {
  final List<int> nodes = <int>[];
  /// O(n) time
  readBT(root, nodes);
  /// O(n*log(n)) time
  nodes.sort();
  /// O(n) time
  return createBST(nodes);
}
