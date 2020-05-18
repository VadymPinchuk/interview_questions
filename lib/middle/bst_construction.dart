import 'dart:math';

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

  bst.remove(10);
  BTreePrinter.printNode(bst.root);
}

class BST {
  BST(int value) : root = Node(value);
  Node root;

  BST insert(int value) {
    Node current = root;
    while (true) {
      if (value < current.value) {
        if (current.left == null) {
          current.left = Node(value);
          break;
        } else {
          current = current.left;
        }
      } else {
        if (current.right == null) {
          current.right = Node(value);
          break;
        } else {
          current = current.right;
        }
      }
    }
    return this;
  }

  bool contains(int value) {
    Node current = root;
    while (current != null) {
      if (current.value == value) {
        return true;
      } else if (value < current.value) {
        current = current.left;
      } else {
        current = current.right;
      }
    }
    return false;
  }

  BST remove(int value, {Node parent, Node cur}) {
    Node current = cur ?? root;
    while (current != null) {
      /// searching for node to be removed
      if (value < current.value) {
        parent = current;
        current = current.left;
      } else if (value > current.value) {
        parent = current;
        current = current.right;
      } else {
        /// when node to be removed found
        /// Case when this is not last node
        if (current.left != null && current.right != null) {
          current.value = findReplacement(current.right);
          remove(current.value, parent: current, cur: current.right);
        } else if (parent == null) {
          /// Case when it is root node with left or right child or none
          if (current.left != null) {
            current.value = current.left.value;
            current.right = current.left.right;
            current.left = current.left.left;
          } else if (current.right != null) {
            current.value = current.right.value;
            current.left = current.right.left;
            current.right = current.right.right;
          } else {
            /// if node to delete is root. The only one exists - edge case
          }
        } else if (parent.left == current) {
          /// Case when current is parent left and current have only one child
          parent.left = current.left ?? current.right;
        } else if (parent.right == current) {
          /// Case when current is parent right and current have only one child
          parent.right = current.left ?? current.right;
        }
        break;
      }
    }
    return this;
  }

  /// Find the leftmost on the right
  int findReplacement(Node nodeToReplace) {
    Node current = nodeToReplace;
    while (current.left != null) {
      current = current.left;
    }
    return current.value;
  }
}

/// NODE class
/// Do not edit the class below.
class Node {
  Node(this.value);

  int value;
  Node right;
  Node left;

  @override
  String toString() => '$value';
}

/// Printer class
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
