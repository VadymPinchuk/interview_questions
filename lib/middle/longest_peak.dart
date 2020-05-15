import 'dart:math';

void main() {
//  print(longestPeak(<int>[1, 2, 3, 2, 1, 3, 4, 5, 6, 7, 6, 5, 4, 3, 2, 1, 0]));
//  print(oneLongestPeak(<int>[1, 2, 3, 2, 1, 3, 4, 5, 6, 7, 6, 5, 4, 3, 2, 1, 0]));
  print(longestPeak(<int>[1, 2, 3, 3, 4, 5, 6, 5, 4, 0, 1, 2, 1, 2, 1, 2, 0]));
  print(oneLongestPeak(<int>[1, 2, 3, 3, 4, 5, 6, 5, 4, 0, 1, 2, 1, 2, 1, 2, 0]));
//  print(longestPeak(<int>[1, 2, 3, 4, 3, 2, 1, 0, 1, -2, -3, -4, -5, -6]));
//  print(oneLongestPeak(<int>[1, 2, 3, 4, 3, 2, 1, 0, 1, -2, -3, -4, -5, -6]));
}

int oneLongestPeak(List<int> array) {
  print(array);
  if (array.length < 3) {
    return 0;
  }

  int maxPeak = 0;
  int index = 1;

  while (index < array.length - 2) {
    int prev = index - 1;
    int next = index + 1;
    final bool isPeak =
        array[index] > array[prev] && array[index] > array[next];
    if (!isPeak) {
      index++;
      continue;
    }

    while (prev > 0) {
      if (array[prev] <= array[prev - 1]) {
        break;
      }
      prev--;
    }
    while (next < array.length - 1) {
      if (array[next] <= array[next + 1]) {
        break;
      }
      next++;
    }
    final int peak = next - prev + 1;
    maxPeak = max(peak, maxPeak);
    index = next;
  }

  return maxPeak;
}

int longestPeak(List<int> array) {
  print(array);
  if (array.length < 3) {
    return 0;
  }

  int maxPeak = 0;
  int counter = 0;
  bool isPeak = false;

  for (int i = 0; i < array.length; i++) {
    final double prevV = (i == 0 ? array[i] : array[i - 1]).toDouble();
    final double currV = array[i].toDouble();
    final double nextV =
        (i == array.length - 1 ? array[i] : array[i + 1]).toDouble();

    if (prevV < currV) {
      if (currV > nextV) {
        isPeak = true;
      }
      counter++;
    }
    if (prevV > currV) {
      // If first point of step is down point of peak
      if (currV <= nextV) {
        counter++;
        if (isPeak) {
          maxPeak = maxPeak < counter ? counter : maxPeak;
        }
        isPeak = false;
        counter = 0;
      }
      counter++;
    }
    if (currV == nextV) {
      isPeak = false;
      counter = 0;
    } else if (prevV == currV) {
      isPeak = false;
      counter++;
    }
  }

  return maxPeak;
}
