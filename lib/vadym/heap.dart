import 'package:useful_extension/useful_extension.dart';

void main() {
  final Heap<int> maxHeap = Heap<int>(<int>[2, 5, 3, 7, 9, 1, 0, 6, 9], (int a, int b) => a > b);
  maxHeap.printSelf();
  final Heap<int> minHeap = Heap<int>(<int>[2, 5, 3, 7, 9, 1, 0, 6, 9], (int a, int b) => a < b);
  minHeap.printSelf();
}

class Heap<T> {
  Heap(this._heap, this.comparator) {
    buildHeap();
  }

  /// List of items and comparator - to create min/max heap
  final List<T> _heap;
  final BiPredicate<T, T> comparator;

  /// Helper functions
  int parentIdx(int childIdx) => (childIdx - 1) ~/ 2;

  int childOneIdx(int parentIdx) => parentIdx * 2 + 1;

  int childTwoIdx(int parentIdx) => parentIdx * 2 + 2;

  bool get isEmpty => size == 0;

  bool get isNotEmpty => size != 0;

  int get size => _heap.length;

  /// O(n) time to build heap of n items
  /// even while siftDown takes log(n) - it is only valid for one top item
  void buildHeap() {
    final int lastIdx = _heap.length - 1;
    int parIdx = parentIdx(lastIdx);
    while (parIdx >= 0) {
      siftDown(parIdx, lastIdx);
      parIdx--;
    }
  }

  /// O(log(n)) time for siftDown operation
  /// Removing first item - so min or max item from the list
  T remove() {
    swap(0, _heap.length - 1);
    final T last = _heap.removeLast();
    siftDown(0, _heap.length - 1);
    return last;
  }

  /// O(log(n)) time
  /// Sift item at index (parent item) down, comparing with its children
  /// if min heap - parent should be bigger to be sifted
  /// if max heap - parent should be smaller to be sifted
  void siftDown(int parentIdx, int endIdx) {
    int chOneIdx = childOneIdx(parentIdx);
    while (chOneIdx <= endIdx) {
      final int chTwoIdx = childTwoIdx(parentIdx) <= endIdx ? childTwoIdx(parentIdx) : -1;
      int indexToSwap;
      if (chTwoIdx != -1) {
        indexToSwap = comparator(_heap[chOneIdx], _heap[chTwoIdx]) ? chOneIdx : chTwoIdx;
      } else {
        indexToSwap = chOneIdx;
      }
      if (comparator(_heap[indexToSwap], _heap[parentIdx])) {
        swap(indexToSwap, parentIdx);
        parentIdx = indexToSwap;
        chOneIdx = childOneIdx(parentIdx);
      } else {
        break;
      }
    }
  }

  /// O(1) time
  /// Swap items between positions
  void swap(int start, int end) {
    final T tmp = _heap[start];
    _heap[start] = _heap[end];
    _heap[end] = tmp;
  }

  /// O(n*log(n)) because iterating over heap,
  /// removing top items, swaping and then sift top item to bottom
  void printSelf() {
    final StringBuffer sb = StringBuffer();

    while (size > 0) {
      sb.write(remove());
      if (size > 0) {
        sb.write(' ,');
      }
    }
    print(sb.toString());
  }
}
