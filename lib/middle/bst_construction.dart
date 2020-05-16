void main() {
  final BST bst = BST(10)
    ..insert(18)
    ..insert(15)
    ..insert(13)
    ..insert(11)
    ..insert(14)
    ..insert(16)
    ..insert(17)
    ..insert(5)
    ..insert(5)
    ..insert(8)
    ..insert(9)
    ..insert(6)
    ..insert(2)
    ..insert(1)
    ..insert(11);
  bst.printBST(bst.root);

  print('   -------------   ');

//  print(bst.contains(13));

  bst.delete(18);
  bst.printBST(bst.root);

}

class BST {
  BST(int value) : root = Node(value);
  Node root;

  void insert(int value) {
    if (value >= root.value) {
      _insertValueInBranch(root.right, root, value);
    } else {
      _insertValueInBranch(root.left, root, value);
    }
  }

  void _insertValueInBranch(Node toCheck, Node parent, int value) {
    while (toCheck != null) {
      parent = toCheck;
      toCheck = value >= toCheck.value ? toCheck.right : toCheck.left;
    }
    toCheck = Node(value);
    if (value >= parent.value) {
      parent.right = toCheck;
    } else {
      parent.left = toCheck;
    }
  }

  bool contains(int value) {
    Node node = root;
    while (node != null) {
      if (node.value == value) {
        return true;
      }
      if (value >= node.value) {
        node = node.right;
        continue;
      }
      if (value < node.value) {
        node = node.left;
        continue;
      }
    }
    return false;
  }

  void delete(int value) {
    Node parent = root;
    Node current = parent.value > value
        ? parent.left
        : (parent.value > value ? parent.right : parent);

    /// find value to be removed and its parent
    while (current != null && current.value != value) {
      parent = current;
      current = parent.value > value ? parent.left : parent.right;
    }
    /// Here current will hold proper value
    /// Find value to be placed on current position. - leftmost on the right;
    Node replacement;
    Node repParent;
    if (current.right != null) {
      repParent = current;
      replacement = current.right;
      while (replacement != null && replacement.left != null) {
        repParent = replacement;
        replacement = replacement.left;
      }
    } else {
      repParent = current;
      replacement = current.left;
    }
    /// case when removing last node
    if (replacement == null) {
      if (parent.value < value) {
        parent.left = null;
      } else {
        parent.right = null;
      }
    } else {
      current.value = replacement.value;
      if (current.right == null) {
        current.left = replacement.left;
        current.right = replacement.right;
      } else {
        repParent.left = replacement.right;
        repParent.right = null;
      }
    }
  }

  void printBST(Node node) {
    print('           ${node.value}   \n'
        '          /  \\    \n'
        '       L ${node.left?.value ?? '-'}   R ${node.right?.value ?? '-'}');
    if (node.left != null) {
      printBST(node.left);
    }
    if (node.right != null) {
      printBST(node.right);
    }
  }
}

// Do not edit the class below.
class Node {
  Node(this.value);

  int value;
  Node right;
  Node left;

  @override
  String toString() => '$value';
}
