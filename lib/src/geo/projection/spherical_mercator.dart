import 'dart:math' as math;

import 'package:flutter_map/src/core/bounds.dart';
import 'package:flutter_map/src/core/point.dart';
import 'package:latlong/latlong.dart';

import 'projection.dart';

class SphericalMercator extends Projection {
  const SphericalMercator() : super();

  static const int r = 6378137;
  static const double maxLatitude = 85.0511287798;
  static const double _boundsD = r * math.pi;
  static Bounds<double> _bounds = Bounds<double>(
    CustomPoint<double>(-_boundsD, -_boundsD),
    CustomPoint<double>(_boundsD, _boundsD),
  );

  Bounds<double> get bounds => _bounds;

  CustomPoint project(LatLng latlng) {
    var d = math.pi / 180;
    var max = maxLatitude;
    var lat = math.max(math.min(max, latlng.latitude), -max);
    var sin = math.sin(lat * d);

    return CustomPoint(
        r * latlng.longitude * d, r * math.log((1 + sin) / (1 - sin)) / 2);
  }

  LatLng unproject(CustomPoint point) {
    const double d = 180 / math.pi;
    return LatLng((2 * math.atan(math.exp(point.y / r)) - (math.pi / 2)) * d,
        point.x * d / r);
  }
}
