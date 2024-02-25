// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskImpl _$$TaskImplFromJson(Map<String, dynamic> json) => _$TaskImpl(
      id: json['id'] as String,
      start: Point.fromJson(json['start'] as Map<String, dynamic>),
      end: Point.fromJson(json['end'] as Map<String, dynamic>),
      field: (json['field'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$TaskImplToJson(_$TaskImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start.toJson(),
      'end': instance.end.toJson(),
      'field': instance.field,
    };
