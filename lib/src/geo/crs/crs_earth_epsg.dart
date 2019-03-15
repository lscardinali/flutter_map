import 'dart:math' as math;

import 'package:flutter_map/src/geo/crs/crs_earth.dart';
import 'package:flutter_map/src/geo/crs/transformation.dart';
import 'package:flutter_map/src/geo/projection/projection.dart';
import 'package:flutter_map/src/geo/projection/spherical_mercator.dart';

class Epsg3857 extends Earth {
  const Epsg3857() : super();

  @override
  String get code => 'EPSG:3857';

  @override
  Projection get projection => const SphericalMercator();

  @override
  Transformation get transformation =>
      const Transformation(_scale, 0.5, -_scale, 0.5);

  static const num _scale = 0.5 / (math.pi * SphericalMercator.r);
}
