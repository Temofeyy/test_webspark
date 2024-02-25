import 'package:freezed_annotation/freezed_annotation.dart';
part 'point.g.dart';

part 'point.freezed.dart';
@freezed
class Point with _$Point {
  const factory Point(
    @JsonKey(name: 'x')
    int x,
    @JsonKey(name: 'y')
    int y,
  ) = _Point;

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}
