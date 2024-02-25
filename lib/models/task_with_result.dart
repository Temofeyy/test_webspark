import 'package:freezed_annotation/freezed_annotation.dart';
import 'point.dart';

import 'task_result.dart';

part 'task_with_result.freezed.dart';
part 'task_with_result.g.dart';

@Freezed()
class TaskWithResult with _$TaskWithResult {
  @JsonSerializable(explicitToJson: true)
  const factory TaskWithResult({
    required String id,
    required Point start,
    required Point end,
    required List<String> field,
    @JsonKey(name: 'result') required Result result,
  }) = _TaskWithResult;

  factory TaskWithResult.fromJson(Map<String, dynamic> json) =>
      _$TaskWithResultFromJson(json);
}

extension Tools on TaskWithResult {
  Map<String, dynamic> toApiJson() => toJson()
    ..remove('start')
    ..remove('end')
    ..remove('field');

  String get resultPath => result.path;

  ///Filled matrix with marks:
  ///
  ///1 - available cell
  ///
  ///0 - blocked cell
  ///
  ///2 - start cell
  ///
  ///3 - end cell
  ///
  ///5 - path cell
  List<List<int>> get matrix {
    const startCellMark = 2;
    const endCellMark = 3;
    const pathCellMark = 5;

    final matrix = field
        .map((e) => e
            .replaceAll('.', '1')
            .replaceAll('X', '0')
            .split('')
            .map(int.parse)
            .toList())
        .toList();

    matrix[start.x][start.y] = startCellMark;
    matrix[end.x][end.y] = endCellMark;

    result.steps
        .sublist(1, result.steps.length - 1)
        .forEach((p) => matrix[p.x][p.y] = pathCellMark);

    return matrix;
  }

  int get matrixSize => field.length;
}
