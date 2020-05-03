// File created by
// Lung Razvan <long1eu>
// on 03/05/2020

final Map<String, Object> tree = {
  'tree': {
    'nodes': [
      {'id': '100', 'left': '5', 'right': '502', 'value': 100},
      {'id': '502', 'left': '204', 'right': '55000', 'value': 502},
      {'id': '55000', 'left': '1001', 'right': null, 'value': 55000},
      {'id': '1001', 'left': null, 'right': '4500', 'value': 1001},
      {'id': '4500', 'left': null, 'right': null, 'value': 4500},
      {'id': '204', 'left': '203', 'right': '205', 'value': 204},
      {'id': '205', 'left': null, 'right': '207', 'value': 205},
      {'id': '207', 'left': '206', 'right': '208', 'value': 207},
      {'id': '208', 'left': null, 'right': null, 'value': 208},
      {'id': '206', 'left': null, 'right': null, 'value': 206},
      {'id': '203', 'left': null, 'right': null, 'value': 203},
      {'id': '5', 'left': '2', 'right': '15', 'value': 5},
      {'id': '15', 'left': '5-2', 'right': '22', 'value': 15},
      {'id': '22', 'left': null, 'right': '57', 'value': 22},
      {'id': '57', 'left': null, 'right': '60', 'value': 57},
      {'id': '60', 'left': null, 'right': null, 'value': 60},
      {'id': '5-2', 'left': null, 'right': null, 'value': 5},
      {'id': '2', 'left': '1', 'right': '3', 'value': 2},
      {'id': '3', 'left': null, 'right': null, 'value': 3},
      {'id': '1', 'left': '-51', 'right': '1-2', 'value': 1},
      {'id': '1-2', 'left': null, 'right': '1-3', 'value': 1},
      {'id': '1-3', 'left': null, 'right': '1-4', 'value': 1},
      {'id': '1-4', 'left': null, 'right': '1-5', 'value': 1},
      {'id': '1-5', 'left': null, 'right': null, 'value': 1},
      {'id': '-51', 'left': '-403', 'right': null, 'value': -51},
      {'id': '-403', 'left': null, 'right': null, 'value': -403}
    ],
    'root': '100'
  },
  'target': 61
};

void main() {
  final int result = findClosestValueInBst(tree['tree'], tree['target']);
  print(result);
}

int findClosestValueInBst(dynamic tree, int target) {
  dynamic node = findNode(tree['nodes'], tree['root']);
  int closest = node['value'];
  while (node != null) {
    if ((target - closest).abs() > (target - node['value']).abs()) {
      closest = node['value'];
    }

    if (node['value'] == target) {
      return target;
    } else if (node['value'] < target) {
      node = findNode(tree['nodes'], node['right']);
    } else {
      node = findNode(tree['nodes'], node['left']);
    }
  }

  return closest;
}

dynamic findNode(List<dynamic> tree, String id) {
  if (id == null) {
    return null;
  }
  return tree.firstWhere((dynamic element) => element['id'] == id);
}
