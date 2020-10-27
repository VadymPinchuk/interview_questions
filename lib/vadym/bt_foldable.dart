import 'package:interview_question/middle/bst_construction.dart';

void main() {
  final BST bst = BST(10)
      .insert(5)
      .insert(4)
      .insert(3)
      .insert(2)
      .insert(8)
      .insert(6)
      .insert(7)
      .insert(15)
      .insert(16)
      .insert(17)
      .insert(18)
      .insert(12)
      .insert(14)
      .insert(13);
  BTreePrinter.printNode(bst.root);
  print('Tree is ${isFoldable(bst.root) ? 'foldable' : 'not foldable'}');
}

bool isFoldable(Node tree) {
  if (tree.left == null || tree.right == null) {
    return false;
  }
  invertTree(tree.left);
  BTreePrinter.printNode(tree.left);
  BTreePrinter.printNode(tree.right);

  if (!isSameStructure(tree.left, tree.right)) {
    return false;
  }

  invertTree(tree.left);
  return true;
}

void invertTree(Node tree) {
  if (tree == null) {
    return;
  }

  Node tmp = tree.left;
  tree.left = tree.right;
  tree.right = tmp;

  invertTree(tree.left);
  invertTree(tree.right);
}

bool isSameStructure(Node left, Node right) {
  if (left == null && right == null) {
    return true;
  }
  if (left.right == null && right.right != null ||
      left.right != null && right.right == null ||
      left.left == null && right.left != null ||
      left.left != null && right.left == null) {
    return false;
  }
  return isSameStructure(left.left, right.left) &&
      isSameStructure(left.right, right.right);
}
