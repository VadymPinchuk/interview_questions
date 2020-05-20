import 'package:interview_question/middle/bst_construction.dart';

void main() {
  final BST bst = BST(10)
      .insert(18)
      .insert(15)
      .insert(13)
      .insert(14)
      .insert(16)
      .insert(17)
      .insert(5)
      .insert(8)
      .insert(9)
      .insert(6)
      .insert(2)
      .insert(1)
      .insert(11);
  BTreePrinter.printNode(bst.root);

  bstReverse(bst.root);
  BTreePrinter.printNode(bst.root);
}

void bstReverse(Node node) {
  if (node != null) {
    final Node tmp = node.left;
    node.left = node.right;
    node.right = tmp;
    bstReverse(node.left);
    bstReverse(node.right);
  }
}