import 'dart:math';

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

void dijkstra(List<List<int>> graph, int src) {
  /// The output array. dist[i] will hold
  final List<int> distances = List<int>(SIZE);

  /// the shortest distance from src to i

  /// sptSet[i] will true if vertex i is included in shortest
  /// path tree or shortest distance from src to i is finalized
  final List<bool> visited = List<bool>(SIZE);

  /// Initialize all distances as INFINITE and stpSet[] as false
  for (int i = 0; i < SIZE; i++) {
    distances[i] = MAX;
    visited[i] = false;
  }

  /// Distance of source vertex from itself is always 0
  distances[src] = 0;

  /// Find shortest path for all vertices
  for (int count = 0; count < SIZE - 1; count++) {
    /// Pick the minimum distance vertex from the set of vertices
    /// not yet processed. u is always equal to src in first
    /// iteration.
    final int nextVertex = minDistance(distances, visited);

    /// Mark the picked vertex as processed
    visited[nextVertex] = true;

    /// Update dist value of the adjacent vertices of the
    /// picked vertex.
    for (int vertex = 0; vertex < SIZE; vertex++) {
      /// Update dist[v] only if is not in visited
      if (visited[vertex]) continue;

      final int edgeWeight = graph[nextVertex][vertex];

      /// There is an edge from nextVertex to vertex
      if (edgeWeight == 0) continue;

      final int distToNext = distances[nextVertex];
      if (distToNext == MAX) continue;

      /// And total weight of path from src to v through u is smaller than current value of dist[v]
      distances[vertex] = min(distToNext + edgeWeight, distances[vertex]);
    }
  }

  /// print the constructed distance array
  printSolution(distances);
}

int minDistance(List<int> distances, List<bool> visited) {
  /// Initialize min value
  int min = MAX;
  int minIndex = -1;

  for (int v = 0; v < SIZE; v++)
    if (visited[v] == false && distances[v] <= min) {
      min = distances[v];
      minIndex = v;
    }

  return minIndex;
}

void printSolution(List<int> distances) {
  print('Vertex \t\t Distance from Source');
  for (int i = 0; i < SIZE; i++) {
    print('$i \t\t ${distances[i]}');
  }
}
