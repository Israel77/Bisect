import 'package:bisect/bisect.dart';

void main() {
  /// Get the letter grade of a test based on it's numerical
  /// marks, using the bisect function for numerical lookup
  String grade(num score, {List<num> breakpoints = const [50, 68, 79, 90], grades = 'FDCBA'}){
    var index = breakpoints.bisect(score);
    return grades[index];
  }

  print(grade(87)); // B
}
