import 'package:interview_question/middle/bst_construction.dart';

void main() {
  final BST tree = BST(1);
  tree.root.left = Node(2);
  tree.root.right = Node(2);
  tree.root.left.left = Node(3);
  tree.root.left.right = Node(4);
  tree.root.right.left = Node(4);
  tree.root.right.right = Node(3);

  BTreePrinter.printNode(tree.root);

  print('Tree is ${isMirror(tree.root.left, tree.root.right) ? 'mirror' : 'not mirror'}');

}

bool isMirror(Node left, Node right) {
  if (left == null && right == null) {
    return true;
  }
  if (left.value == right.value) {
    return true;
  }
  return isMirror(left.left, right.right) && isMirror(left.right, right.left);
}
