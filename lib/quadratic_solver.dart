import 'dart:math';

const double epsilon = 1E-15;

/// Функция для решения квадратного уравнения
List<double> solve(double a, double b, double c) {
  // a != 0
  if (a.abs() <= epsilon) {
    throw FormatException();
  }

  final d = b * b - 4 * a * c;

  // d < 0
  if (d < -epsilon) {
    return [];
  }

  final x1 = (-b + sqrt(d)) / (2 * a);

  // d = 0
  if (d.abs() <= epsilon) {
    return [x1, x1];
  }

  final x2 = (-b - sqrt(d)) / (2 * a);

  // d > 0
  return [x1, x2];
}
