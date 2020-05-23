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

  print('inorderMorrisTraversal ${inorderMorrisTraversal(bst.root, <int>[])}');
  print('inOrderTraverse ${inOrderTraverse(bst.root, <int>[])}');
  print('preOrderTraverse ${preOrderTraverse(bst.root, <int>[])}');
  print('postOrderTraverse ${postOrderTraverse(bst.root, <int>[])}');
  print('sumTraverse ${sumTraverse(bst.root, 0, <int>[])}');
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

/// https://www.geeksforgeeks.org/inorder-tree-traversal-without-recursion-and-without-stack/
List<int> inorderMorrisTraversal(Node root, List<int> result) {
  Node current, pre;

  if (root == null) {
    return result;
  }

  current = root;
  while (current != null) {
    if (current.left == null) {
      result.add(current.value);
      current = current.right;
    } else {
      /// Find the inorder predecessor of current
      pre = current.left;
      while (pre.right != null && pre.right != current) {
        pre = pre.right;
      }

      /// Make current as right child of its inorder predecessor
      if (pre.right == null) {
        pre.right = current;
        current = current.left;
      } else {
        /// Revert the changes made in the 'if' part to restore the
        /// original tree i.e., fix the right child of predecessor

        pre.right = null;
        result.add(current.value);
        current = current.right;
      } // End of if condition pre->right == NULL
    } // End of if condition current->left == NULL
  }
  return result;// End of while
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

/// traverse in order: value - left - right
List<int> sumTraverse(Node tree, int sum, List<int> results) {
  if (tree.left != null) {
    sumTraverse(tree.left, sum + tree.value, results);
  }
  if (tree.right != null) {
    sumTraverse(tree.right, sum + tree.value, results);
  }
  if (tree.left == null && tree.right == null) {
    results.add(sum + tree.value);
  }
  return results;
}
