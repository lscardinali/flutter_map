import 'dart:math' as math;

import 'point.dart';

class Bounds<T extends num> {
  factory Bounds(CustomPoint<T> a, CustomPoint<T> b) {
    final Bounds<T> bounds1 = Bounds<T>._(a, b);
    final Bounds<T> bounds2 = bounds1.extend(a);
    return bounds2.extend(b);
  }

  const Bounds._(this.min, this.max);

  final CustomPoint<T> min;
  final CustomPoint<T> max;

  Bounds<T> extend(CustomPoint<T> point) {
    CustomPoint<T> newMin;
    CustomPoint<T> newMax;
    if (min == null && max == null) {
      newMin = point;
      newMax = point;
    } else {
      final num minX = math.min(point.x, min.x);
      final num maxX = math.max(point.x, max.x);
      final num minY = math.min(point.y, min.y);
      final num maxY = math.max(point.y, max.y);
      newMin = CustomPoint<T>(minX, minY);
      newMax = CustomPoint<T>(maxX, maxY);
    }
    return Bounds<T>._(newMin, newMax);
  }

  CustomPoint<double> getCenter() => CustomPoint<double>(
        (min.x + max.x) / 2,
        (min.y + max.y) / 2,
      );

  CustomPoint<T> get bottomLeft => CustomPoint<T>(min.x, max.y);
  CustomPoint<T> get topRight => CustomPoint<T>(max.x, min.y);
  CustomPoint<T> get topLeft => min;
  CustomPoint<T> get bottomRight => max;
  CustomPoint<T> get size => max - min;

  bool contains(CustomPoint<T> point) =>
      containsBounds(Bounds<T>(point, point));

  bool containsBounds(Bounds<T> b) =>
      b.min.x >= min.x &&
      b.max.x <= max.x &&
      b.min.y >= min.y &&
      b.max.y <= max.y;

  @override
  String toString() => 'Bounds($min, $max)';
}
