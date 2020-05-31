import 'package:bisect/bisect.dart';
import 'package:test/test.dart';

void main() {
  group('bisect(Right) and bisectLeft', () {
    test('returns the index to insert in an ordered list', () {
      final list = [0, 2, 3, 4, 5, 7];
      expect(list.bisect(1), 1);
    });

    test('can work with another compare function', () {
      final absoluteCompare = (int x, int y) => (x.abs() - y.abs());
      final list = [1, -1, 4, -5, -8];
      expect(list.bisect(-2, compare: absoluteCompare), 2);
    });

    test(
        "can use the compare parameter to work with types that don't implement Comparable",
        () {
      final compareByLength = (Iterable a, Iterable b) =>
          //if                           else if                   else
          (a.length < b.length) ? -1 : ((a.length == b.length) ? 0 : 1);
      final list = [
        [],
        [-1],
        ['This', 'library', 'is', 'awesome'],
      ];
      expect(list.bisect(['foo', 'bar'], compare: compareByLength), 2);
    });

    test('use the low and high parameters', () {
      final bigList = [
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        8,
        9,
        10,
        20,
        30,
        40,
        50,
        60,
        70,
        80,
        90,
        100,
        200,
        300,
        400,
        500,
        600,
        700,
        800,
        900,
        1000
      ];
      expect(bigList.bisect(53, low: 10, high: 20), 14);
    });

    test('get the rightmost value', () {
      final list = [0, 0, 0, 0, 0, 0];
      expect(list.bisectRight(1), list.length);
    });

    test('get the leftmost value', () {
      final list = [1, 1, 1, 1, 1, 1];
      expect(list.bisectLeft(0), 0);
    });
  });

  group('insort(Right) and insortLeft', () {
    test('inserts an item in a sorted list without changing sorting', () {
      var list = [1, 2, 3, 4, 6];
      list.insort(5);
      expect(list, [1, 2, 3, 4, 5, 6]);
    });

    test('can use optional parameters like bisect', () {
      // Sorted by the absolute values of the numbers
      final list = [0, -1, -3, 3, 4, -4, 4, -6, 7, 7];
      int absoluteCompare(a, b) => (a.abs() - b.abs());
      list.insortLeft(6, compare: absoluteCompare, low: 3, high: 7);
      expect(list, [0, -1, -3, 3, 4, -4, 4, 6, -6, 7, 7]);
    });
  });
}
