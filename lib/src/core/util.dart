import 'package:tuple/tuple.dart';

final RegExp _templateRe = RegExp(r'\{ *([\w_-]+) *\}');

String template(String str, Map<String, String> data) {
  return str.replaceAllMapped(_templateRe, (Match match) {
    final String value = data[match.group(1)];
    if (value == null) {
      throw 'No value provided for variable ${match.group(1)}';
    } else {
      return value;
    }
  });
}

double wrapNum(double x, Tuple2<double, double> range, [bool includeMax]) {
  final double max = range.item2;
  final double min = range.item1;
  final double d = max - min;
  return x == max && includeMax != null ? x : ((x - min) % d + d) % d + min;
}
