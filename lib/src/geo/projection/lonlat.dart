import 'package:flutter_map/src/core/bounds.dart';
import 'package:flutter_map/src/core/point.dart';
import 'package:flutter_map/src/geo/projection/projection.dart';
import 'package:latlong/latlong.dart';

class LonLat extends Projection {
  @override
  Bounds<double> get bounds => Bounds<double>(
        CustomPoint<double>(-180, -90),
        CustomPoint<double>(180, 90),
      );

  @override
  CustomPoint<double> project(LatLng latlng) =>
      CustomPoint<double>(latlng.latitude, latlng.longitude);

  @override
  LatLng unproject(CustomPoint<num> point) => LatLng(point.x, point.y);
}
