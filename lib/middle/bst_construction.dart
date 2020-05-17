import 'dart:math';

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
  BTreePrinter.printNode(bst.root);

  bst.delete(15);
  BTreePrinter.printNode(bst.root);
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
    print('delete $value');
    Node parent;
    Node current = root.value > value
        ? root.left
        : (root.value > value ? root.right : root);

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
      if (parent != null && parent.value < value) {
        parent?.left = null;
      } else {
        parent?.right = null;
      }
    } else {
      current.value = replacement.value;
      if (current.right == null) {
        current.left = replacement.left;
        current.right = replacement.right;
      } else if (current != repParent){
        repParent.left = replacement.right;
      } else {
        current.right = replacement.right;
      }
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

class BTreePrinter {
  static void printNode(Node root) =>
      printNodeInternal(<Node>[root], 1, BTreePrinter.maxLevel(root));

  static void printNodeInternal(List<Node> nodes, int level, int maxLevel) {
    if (nodes.isEmpty || BTreePrinter.isAllElementsNull(nodes)) {
      return;
    }
    StringBuffer result = StringBuffer();

    final int floor = maxLevel - level;
    final int edgeLines = pow(2, max(floor - 1, 0));
    final int firstSpaces = pow(2, floor) - 1;
    final int betweenSpaces = pow(2, floor + 1) - 1;

    BTreePrinter.printWhitespaces(firstSpaces, result);

    List<Node> newNodes = <Node>[];
    for (Node node in nodes) {
      if (node != null) {
        result.write(node.value);
        newNodes.add(node.left);
        newNodes.add(node.right);
      } else {
        newNodes.add(null);
        newNodes.add(null);
        result.write(' ');
      }

      BTreePrinter.printWhitespaces(betweenSpaces, result);
    }
    print(result.toString());
    result.clear();

    for (int i = 1; i <= edgeLines; i++) {
      for (int j = 0; j < nodes.length; j++) {
        BTreePrinter.printWhitespaces(firstSpaces - i, result);
        if (nodes[j] == null) {
          BTreePrinter.printWhitespaces(edgeLines + edgeLines + i + 1, result);
          continue;
        }

        if (nodes[j].left != null) {
          result.write('/');
        } else {
          BTreePrinter.printWhitespaces(1, result);
        }

        BTreePrinter.printWhitespaces(i + i - 1, result);

        if (nodes[j].right != null) {
          result.write('\\');
        } else {
          BTreePrinter.printWhitespaces(1, result);
        }

        BTreePrinter.printWhitespaces(edgeLines + edgeLines - i, result);
      }
      print(result.toString());
      result.clear();
    }

    printNodeInternal(newNodes, level + 1, maxLevel);
  }

  static void printWhitespaces(int count, StringBuffer result) {
    for (int i = 0; i < count; i++) {
      result.write(' ');
    }
  }

  static int maxLevel(Node node) {
    if (node == null) {
      return 0;
    }

    return max(BTreePrinter.maxLevel(node.left),
            BTreePrinter.maxLevel(node.right)) +
        1;
  }

  static bool isAllElementsNull(List<Node> list) {
    for (final Node node in list) {
      if (node != null) {
        return false;
      }
    }
    return true;
  }
}
