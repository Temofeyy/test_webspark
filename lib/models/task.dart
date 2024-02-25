import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_webspark/models/point.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@Freezed()
class Task with _$Task {
  @JsonSerializable(explicitToJson: true)
  const factory Task({
    required String id,
    required Point start,
    required Point end,
    required List<String> field,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);
}

extension Tools on Task {
  List<List<int>> get matrix => field
      .map((e) => e
          .replaceAll('.', '1')
          .replaceAll('X', '0')
          .split('')
          .map(int.parse)
          .toList())
      .toList();
}
