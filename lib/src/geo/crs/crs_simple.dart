import 'dart:math' as math;

import 'package:flutter_map/src/geo/crs/transformation.dart';
import 'package:flutter_map/src/geo/projection/lonlat.dart';
import 'package:flutter_map/src/geo/projection/projection.dart';
import 'package:tuple/tuple.dart';

import 'crs.dart';

class Simple extends Crs {
  @override
  String get code => 'Simple';

  @override
  Projection get projection => LonLat();

  @override
  Transformation get transformation => const Transformation(1, 0, -1, 0);

  @override
  num scale(double zoom) => math.pow(2, zoom);

  @override
  num zoom(double scale) => math.log(scale) / math.ln2;

  @override
  bool get infinite => true;

  @override
  Tuple2<double, double> get wrapLat =>
      const Tuple2<double, double>(-180.0, 180.0);

  @override
  Tuple2<double, double> get wrapLng =>
      const Tuple2<double, double>(-90.0, 90.0);
}
