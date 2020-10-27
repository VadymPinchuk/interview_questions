import 'package:dart_numerics/dart_numerics.dart';

const int SIZE = 9;
const int MAX = int64MaxValue;

void main() {
  final List<List<int>> graph = <List<int>>[
    <int>[0, 4, 0, 0, 0, 0, 0, 8, 0],
    <int>[4, 0, 8, 0, 0, 0, 0, 11, 0],
    <int>[0, 8, 0, 7, 0, 4, 0, 0, 2],
    <int>[0, 0, 7, 0, 9, 14, 0, 0, 0],
    <int>[0, 0, 0, 9, 0, 10, 0, 0, 0],
    <int>[0, 0, 4, 14, 10, 0, 2, 0, 0],
    <int>[0, 0, 0, 0, 0, 2, 0, 1, 6],
    <int>[8, 11, 0, 0, 0, 0, 1, 0, 7],
    <int>[0, 0, 2, 0, 0, 0, 6, 7, 0],
  ];
  dijkstra(graph, 0);
}

int minDistance(List<int> dist, List<bool> sptSet) {
  /// Initialize min value
  int min = MAX;
  int minIndex = -1;

  for (int v = 0; v < SIZE; v++)
    if (sptSet[v] == false && dist[v] <= min) {
      min = dist[v];
      minIndex = v;
    }

  return minIndex;
}

void printSolution(List<int> dist) {
  print('Vertex \t\t Distance from Source');
  for (int i = 0; i < SIZE; i++) {
    print('$i \t\t ${dist[i]}');
  }
}

void dijkstra(List<List<int>> graph, int src) {
  /// The output array. dist[i] will hold
  List<int> dist = List<int>(SIZE);

  /// the shortest distance from src to i

  /// sptSet[i] will true if vertex i is included in shortest
  /// path tree or shortest distance from src to i is finalized
  List<bool> sptSet = List<bool>(SIZE);

  /// Initialize all distances as INFINITE and stpSet[] as false
  for (int i = 0; i < SIZE; i++) {
    dist[i] = MAX;
    sptSet[i] = false;
  }

  /// Distance of source vertex from itself is always 0
  dist[src] = 0;

  /// Find shortest path for all vertices
  for (int count = 0; count < SIZE - 1; count++) {
    /// Pick the minimum distance vertex from the set of vertices
    /// not yet processed. u is always equal to src in first
    /// iteration.
    int u = minDistance(dist, sptSet);

    /// Mark the picked vertex as processed
    sptSet[u] = true;

    /// Update dist value of the adjacent vertices of the
    /// picked vertex.
    for (int v = 0; v < SIZE; v++)

      /// Update dist[v] only if is not in sptSet, there is an
      /// edge from u to v, and total weight of path from src to
      /// v through u is smaller than current value of dist[v]
      if (!sptSet[v] && graph[u][v] != 0 && dist[u] != MAX && dist[u] + graph[u][v] < dist[v])
        dist[v] = dist[u] + graph[u][v];
  }

  /// print the constructed distance array
  printSolution(dist);
}
