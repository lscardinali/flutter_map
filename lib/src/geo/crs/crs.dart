import 'dart:math' as math;

import 'package:flutter_map/src/core/bounds.dart';
import 'package:flutter_map/src/core/point.dart';
import 'package:flutter_map/src/geo/crs/transformation.dart';
import 'package:flutter_map/src/geo/projection/projection.dart';
import 'package:latlong/latlong.dart';
import 'package:tuple/tuple.dart';

abstract class Crs {
  const Crs();

  String get code;
  Projection get projection;
  Transformation get transformation;

  num scale(double zoom) => 256 * math.pow(2, zoom);
  num zoom(double scale) => math.log(scale / 256) / math.ln2;

  CustomPoint<num> latLngToPoint(LatLng latlng, double zoom) {
    try {
      final CustomPoint<num> projectedPoint = projection.project(latlng);
      return transformation.transform(
          point: projectedPoint, scale: scale(zoom).toDouble());
    } catch (e) {
      return const CustomPoint<num>(0.0, 0.0);
    }
  }

  LatLng pointToLatLng(CustomPoint<num> point, double zoom) {
    try {
      final CustomPoint<num> untransformedPoint = transformation.untransform(
          point: point, scale: scale(zoom).toDouble());
      return projection.unproject(untransformedPoint);
    } catch (e) {
      return null;
    }
  }

  Bounds getProjectedBounds(double zoom) {
    if (infinite) {
      return null;
    }

    final Bounds<double> b = projection.bounds;
    final double s = scale(zoom);
    final CustomPoint<num> min =
        transformation.transform(point: b.min, scale: s.toDouble());
    final CustomPoint<num> max =
        transformation.transform(point: b.max, scale: s.toDouble());
    return Bounds(min, max);
  }

  bool get infinite;
  Tuple2<double, double> get wrapLng;
  Tuple2<double, double> get wrapLat;
}
