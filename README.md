Array bisection algorithm for Dart.

Simple array bisection algorithm translated from [Python's default library](https://docs.python.org/3/library/bisect.html) and implemented as extension methods for the class.

These methods are used to insert an element in a sorted list, without needing to sort it again.

## Usage

A simple usage example:

```dart
import 'package:bisect/bisect.dart';

main() {
  final sortedList = [1, 3, 4, 6, 8, 23, 75];

  // Get the index where to insert an element
  final index = sortedList.bisect(7);
  print(index); // 4

  // Inserts an element to the list while keeping sorting
  sortedList.insort(7);
  print(sortedList); // [1, 3, 4, 6, 7, 8, 23, 75]

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/Israel77/Bisect/issues
