// File created by
// Lung Razvan <long1eu>
// on 05/05/2020

void main() {
  final Node first = Node('first');
  final Node second = Node('second');
  final Node third = Node('third');
  final Node fourth = Node('fourth');
  final Node fifth = Node('fifth');
  final Node six = Node('six');
  first.addChild('1.1');
  second.addChild('2.1');
  second.addChild('2.2');
  third.addChild('3.1');
  third.addChild('3.2');
  third.addChild('3.3');
  fourth.addChild('4.1');
  fifth.addChild('5.1');
  six.addChild('6.1');

  print(first.depthFirstSearch(<String>[]));
}

class Node {
  Node(this.name);

  final String name;
  final List<Node> children = <Node>[];

  Node addChild(String name) {
    children.add(Node(name));
    return this;
  }

  // O(n) | O(n) space
  List<String> depthFirstSearch(List<String> values) {
    values.add(name);
    for (Node node in children) {
      node.depthFirstSearch(values);
    }

    return values;
  }

  @override
  String toString() => name;
}
