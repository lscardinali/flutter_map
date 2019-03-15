import 'dart:math' as math;

class CustomPoint<T extends num> extends math.Point<T> {
  const CustomPoint(num x, num y) : super(x, y);

  @override
  CustomPoint<T> operator +(math.Point<T> other) =>
      CustomPoint<T>(x + other.x, y + other.y);

  @override
  CustomPoint<T> operator -(math.Point<T> other) =>
      CustomPoint<T>(x - other.x, y - other.y);

  @override
  CustomPoint<T> operator *(num /*T|int*/ factor) =>
      CustomPoint<T>(x * factor, y * factor);

  CustomPoint<T> operator /(num /*T|int*/ factor) =>
      CustomPoint<T>(x / factor, y / factor);

  CustomPoint<T> get ceil => CustomPoint<T>(x.ceil(), y.ceil());

  CustomPoint<T> get floor => CustomPoint<T>(x.floor(), y.floor());

  CustomPoint<T> unscaleBy(CustomPoint<T> point) =>
      CustomPoint<T>(x / point.x, y / point.y);

  CustomPoint scaleBy(CustomPoint point) =>
      CustomPoint(x * point.x, y * point.y);

  CustomPoint round() {
    final num x = this.x is double ? this.x.round() : this.x;
    final num y = this.y is double ? this.y.round() : this.y;
    return CustomPoint(x, y);
  }

  CustomPoint multiplyBy(num n) => CustomPoint(x * n, y * n);

  @override
  String toString() => 'CustomPoint ($x, $y)';
}
