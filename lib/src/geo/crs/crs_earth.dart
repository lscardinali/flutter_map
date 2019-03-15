import 'package:tuple/tuple.dart';

import 'crs.dart';

abstract class Earth extends Crs {
  const Earth() : super();

  @override
  bool get infinite => false;

  @override
  Tuple2<double, double> get wrapLat => null;

  @override
  Tuple2<double, double> get wrapLng =>
      const Tuple2<double, double>(-180.0, 180.0);
}
