import 'package:test_webspark/models/point.dart';

import 'models/task.dart';
import 'models/task_result.dart';
import 'models/task_with_result.dart';

extension StringPath on List<Point> {
  String get stringPath => map((e) => '(${e.x},${e.y})').join('->');
}


