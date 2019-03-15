import 'package:flutter_map/src/core/bounds.dart';
import 'package:flutter_map/src/core/point.dart';
import 'package:latlong/latlong.dart';

abstract class Projection {
  const Projection();

  Bounds<double> get bounds;
  CustomPoint project(LatLng latlng);
  LatLng unproject(CustomPoint point);
}
