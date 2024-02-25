import 'package:freezed_annotation/freezed_annotation.dart';
import 'point.dart';

part 'task_result.freezed.dart';

part 'task_result.g.dart';

@freezed
class Result with _$Result {
  @JsonSerializable(explicitToJson: true)
  const factory Result({
    required List<Point> steps,
    required String path,

  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

}