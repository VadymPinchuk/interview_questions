import 'package:interview_question/middle/bst_construction.dart';

/// BT is continuous if difference between parent and child values is <= 1
void main() {
  final BST bst = BST(10).insert(9).insert(8).insert(11).insert(12).insert(15);
  if (checkIfContinuous(bst.root)) {
    print('BT is continuous');
  }
}

bool checkIfContinuous(Node node) {
  if (node == null) {
    return true;
  }
  if (node.left != null && (node.left.value - node.value).abs() > 1) {
    print(
        'BT is not continuous because parent: ${node.value} and left: ${node.left.value}');
    return false;
  }
  if (node.right != null && (node.right.value - node.value).abs() > 1) {
    print(
        'BT is not continuous because parent: ${node.value} and right: ${node.right.value}');
    return false;
  }

  return checkIfContinuous(node.left) && checkIfContinuous(node.right);
}
