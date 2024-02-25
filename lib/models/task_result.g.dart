// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      steps: (json['steps'] as List<dynamic>)
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
      path: json['path'] as String,
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'steps': instance.steps.map((e) => e.toJson()).toList(),
      'path': instance.path,
    };
