import 'package:flutter_map/src/core/point.dart';

class Transformation {
  const Transformation(this.a, this.b, this.c, this.d);
  final num a;
  final num b;
  final num c;
  final num d;

  CustomPoint<num> transform({CustomPoint<num> point, double scale = 1.0}) =>
      CustomPoint<double>(
          scale * (a * point.x + b), (scale ?? 1.0) * (c * point.y + d));

  CustomPoint<num> untransform({CustomPoint<num> point, double scale = 1.0}) =>
      CustomPoint<double>(
          (point.x / scale - b) / a, (point.y / (scale ?? 1.0) - d) / c);
}
