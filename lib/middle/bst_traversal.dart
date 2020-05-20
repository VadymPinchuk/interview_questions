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

  print('inOrderTraverse ${inOrderTraverse(bst.root, <int>[])}');
  print('preOrderTraverse ${preOrderTraverse(bst.root, <int>[])}');
  print('postOrderTraverse ${postOrderTraverse(bst.root, <int>[])}');
}

/// traverse in order: left - value - right
List<int> inOrderTraverse(Node tree, List<int> result) {
  if (tree != null) {
    inOrderTraverse(tree.left, result);
    result.add(tree.value);
    inOrderTraverse(tree.right, result);
  }
  return result;
}

/// traverse in order: value - left - right
List<int> preOrderTraverse(Node tree, List<int> result) {
  if (tree != null) {
    result.add(tree.value);
    preOrderTraverse(tree.left, result);
    preOrderTraverse(tree.right, result);
  }
  return result;
}

/// traverse in order: left - right - value
List<int> postOrderTraverse(Node tree, List<int> result) {
  if (tree != null) {
    postOrderTraverse(tree.left, result);
    postOrderTraverse(tree.right, result);
    result.add(tree.value);
  }
  return result;
}
