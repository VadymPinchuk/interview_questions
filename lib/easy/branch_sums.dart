final Map<String, dynamic> input = <String, dynamic>{
  "tree": {
    "nodes": [
      {"id": "1", "left": "2", "right": null, "value": 1},
      {"id": "2", "left": null, "right": null, "value": 2}
    ],
    "root": "1"
  }
};
final List<dynamic> dataList = input['tree']['nodes'];

void main() {
  dynamic rootNode = findNode(input['tree']['root']);
  List<int> results = <int>[];
  calculateSum(rootNode, 0, results);
  print(results.toString());
}

void calculateSum(dynamic node, int result, List<int> data) {
  if (node == null) return;
  dynamic leftId = node['left'];
  dynamic rightId = node['right'];
  final int value = result + node['value'];
  if (leftId != null || rightId != null) {
    calculateSum(findNode(leftId), value, data);
    calculateSum(findNode(rightId), value, data);
  } else {
    data.add(value);
  }
}

dynamic findNode(String id) {
  if (id == null) {
    return null;
  }
  return dataList.firstWhere((dynamic element) => element['id'] == id);
}
