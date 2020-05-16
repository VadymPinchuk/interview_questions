void main() {
  final Node node1 = Node(1);
  final Node node2 = Node(2);
  final Node node3 = Node(3);
  final Node node4 = Node(4);
  final Node node6 = Node(6);
  final DoublyLinkedList list = DoublyLinkedList()
    ..insertAtPosition(1, Node(5))
    ..insertAtPosition(1, node4)
    ..insertAtPosition(1, node3)
    ..insertAtPosition(1, node2)
    ..insertAtPosition(1, node1);

  list
    ..setHead(node4)
    ..setTail(node6)
    ..insertBefore(node6, node3)
    ..insertAfter(node6, Node(3))
    ..insertAtPosition(1, Node(3))
    ..removeNodesWithValue(3)
    ..remove(node2);

  print(list);
  print(list.containsNodeWithValue(3));
}

class DoublyLinkedList {
  Node head;
  Node tail;

  void setHead(Node node) {
    insertBefore(head, node);
    head = node;
  }

  void setTail(Node node) {
    insertAfter(tail, node);
    tail = node;
  }

  void insertBefore(Node node, Node nodeToInsert) {
    remove(nodeToInsert);

    nodeToInsert.next = node;
    nodeToInsert.prev = node.prev;
    node.prev?.next = nodeToInsert;
    node.prev = nodeToInsert;
  }

  void insertAfter(Node node, Node nodeToInsert) {
    remove(nodeToInsert);

    nodeToInsert.prev = node;
    nodeToInsert.next = node.next;
    node.next?.prev = nodeToInsert;
    node.next = nodeToInsert;
  }

  void insertAtPosition(int position, Node nodeToInsert) {
    // edge case if Head
    if (position == 1) {
      if (head != null) {
        setHead(nodeToInsert);
      } else {
        head = nodeToInsert;
        tail = nodeToInsert;
      }
      return;
    }

    Node atPosition = head;
    for (int i = 2; i <= position; i++) {
      if (atPosition == null) {
        throw ArgumentError('message');
      }
      atPosition = atPosition.next;
    }
    // Edge case if Tail
    if (atPosition == null) {
      tail.next = nodeToInsert;
      nodeToInsert.prev = tail;
    } else {
      // Normal case
      insertBefore(atPosition, nodeToInsert);
    }
  }

  void removeNodesWithValue(int value) {
    Node node = head;
    while (node != null) {
      if (node.value == value) {
        remove(node);
        if (node.prev == null) {
          head = node.next;
        }
        if (node.next == null) {
          tail = node.prev;
        }
      }
      node = node.next;
    }
  }

  void remove(Node node) {
    node.prev?.next = node.next;
    node.next?.prev = node.prev;
  }

  bool containsNodeWithValue(int value) {
    Node node = head;
    while (node != null) {
      if (node.value == value) {
        return true;
      }
      node = node.next;
    }
    return false;
  }

  @override
  String toString() {
    Node node = head;
    final StringBuffer result = StringBuffer();
    while (node != null) {
      result.writeln('${node.prev} -> ${node.value} -> ${node.next}');
      node = node.next;
    }
    return result.toString();
  }
}

// Do not edit the class below.
class Node {
  Node(this.value);

  final int value;
  Node prev;
  Node next;

  @override
  String toString() => 'Node{value: $value}';
}
