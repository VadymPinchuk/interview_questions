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

  print(validateBST(bst.root, double.negativeInfinity, double.infinity));
}

bool validateBST(Node branch, double min, double max) {
  if (branch.value < min || branch.value >= max) {
    return false;
  }
  final bool left = branch.left == null ||
      validateBST(branch.left, min, branch.value.toDouble());
  final bool right = branch.right == null ||
      validateBST(branch.right, branch.value.toDouble(), max);

  return left && right;
}
