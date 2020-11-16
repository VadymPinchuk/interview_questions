import 'dart:collection';
import 'dart:math';

import 'package:interview_question/vadym/heap.dart';

/// Get amount of flights which will be in the air in the same time.
/// [2,5] [3,6] [8,9] - 2

void main() {
  final List<Flight> races = <Flight>[];
  races.add(Flight(2, 8));
  races.add(Flight(4, 8));
  races.add(Flight(8, 15));
  races.add(Flight(9, 19));
  races.add(Flight(12, 23));
  races.add(Flight(17, 20));
  print(getMaxFlightsInTheAir(races));
}

int getMaxFlightsInTheAir(List<Flight> races) {
  int maxFlightsInTheAir = 0;
  /// O(n) time complexity to create heap
  final Heap<Flight> flightsQueue = Heap<Flight>(
      races,
      (Flight one, Flight two) =>
          one.departure == two.departure ? one.arrival < two.arrival : one.departure < two.departure);
  final ListQueue<Flight> flightsInTheAir = ListQueue<Flight>();

  /// O(n*log(n)) time to iterate over all items from heap
  while (flightsQueue.isNotEmpty) {
    final Flight next = flightsQueue.remove();
    while (flightsInTheAir.isNotEmpty && flightsInTheAir.first.arrival <= next.departure) {
      flightsInTheAir.removeFirst();
    }
    flightsInTheAir.add(next);
    maxFlightsInTheAir = max(maxFlightsInTheAir, flightsInTheAir.length);
  }

  return maxFlightsInTheAir;
}

class Flight {
  Flight(this.departure, this.arrival);

  int departure;
  int arrival;
}
