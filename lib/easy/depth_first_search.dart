// File created by
// Lung Razvan <long1eu>
// on 05/05/2020

void main() {}

class Node {
  Node(this.name);

  final String name;
  List<Node> children;

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
}
