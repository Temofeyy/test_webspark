// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_with_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskWithResultImpl _$$TaskWithResultImplFromJson(Map<String, dynamic> json) =>
    _$TaskWithResultImpl(
      id: json['id'] as String,
      start: Point.fromJson(json['start'] as Map<String, dynamic>),
      end: Point.fromJson(json['end'] as Map<String, dynamic>),
      field: (json['field'] as List<dynamic>).map((e) => e as String).toList(),
      result: Result.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskWithResultImplToJson(
        _$TaskWithResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start.toJson(),
      'end': instance.end.toJson(),
      'field': instance.field,
      'result': instance.result.toJson(),
    };
