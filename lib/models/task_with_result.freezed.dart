// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_with_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskWithResult _$TaskWithResultFromJson(Map<String, dynamic> json) {
  return _TaskWithResult.fromJson(json);
}

/// @nodoc
mixin _$TaskWithResult {
  String get id => throw _privateConstructorUsedError;
  Point get start => throw _privateConstructorUsedError;
  Point get end => throw _privateConstructorUsedError;
  List<String> get field => throw _privateConstructorUsedError;
  @JsonKey(name: 'result')
  Result get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskWithResultCopyWith<TaskWithResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskWithResultCopyWith<$Res> {
  factory $TaskWithResultCopyWith(
          TaskWithResult value, $Res Function(TaskWithResult) then) =
      _$TaskWithResultCopyWithImpl<$Res, TaskWithResult>;
  @useResult
  $Res call(
      {String id,
      Point start,
      Point end,
      List<String> field,
      @JsonKey(name: 'result') Result result});

  $PointCopyWith<$Res> get start;
  $PointCopyWith<$Res> get end;
  $ResultCopyWith<$Res> get result;
}

/// @nodoc
class _$TaskWithResultCopyWithImpl<$Res, $Val extends TaskWithResult>
    implements $TaskWithResultCopyWith<$Res> {
  _$TaskWithResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? field = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Point,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Point,
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as List<String>,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PointCopyWith<$Res> get start {
    return $PointCopyWith<$Res>(_value.start, (value) {
      return _then(_value.copyWith(start: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PointCopyWith<$Res> get end {
    return $PointCopyWith<$Res>(_value.end, (value) {
      return _then(_value.copyWith(end: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<$Res> get result {
    return $ResultCopyWith<$Res>(_value.result, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskWithResultImplCopyWith<$Res>
    implements $TaskWithResultCopyWith<$Res> {
  factory _$$TaskWithResultImplCopyWith(_$TaskWithResultImpl value,
          $Res Function(_$TaskWithResultImpl) then) =
      __$$TaskWithResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Point start,
      Point end,
      List<String> field,
      @JsonKey(name: 'result') Result result});

  @override
  $PointCopyWith<$Res> get start;
  @override
  $PointCopyWith<$Res> get end;
  @override
  $ResultCopyWith<$Res> get result;
}

/// @nodoc
class __$$TaskWithResultImplCopyWithImpl<$Res>
    extends _$TaskWithResultCopyWithImpl<$Res, _$TaskWithResultImpl>
    implements _$$TaskWithResultImplCopyWith<$Res> {
  __$$TaskWithResultImplCopyWithImpl(
      _$TaskWithResultImpl _value, $Res Function(_$TaskWithResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? field = null,
    Object? result = null,
  }) {
    return _then(_$TaskWithResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Point,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Point,
      field: null == field
          ? _value._field
          : field // ignore: cast_nullable_to_non_nullable
              as List<String>,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$TaskWithResultImpl implements _TaskWithResult {
  const _$TaskWithResultImpl(
      {required this.id,
      required this.start,
      required this.end,
      required final List<String> field,
      @JsonKey(name: 'result') required this.result})
      : _field = field;

  factory _$TaskWithResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskWithResultImplFromJson(json);

  @override
  final String id;
  @override
  final Point start;
  @override
  final Point end;
  final List<String> _field;
  @override
  List<String> get field {
    if (_field is EqualUnmodifiableListView) return _field;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_field);
  }

  @override
  @JsonKey(name: 'result')
  final Result result;

  @override
  String toString() {
    return 'TaskWithResult(id: $id, start: $start, end: $end, field: $field, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskWithResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            const DeepCollectionEquality().equals(other._field, _field) &&
            (identical(other.result, result) || other.result == result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, start, end,
      const DeepCollectionEquality().hash(_field), result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskWithResultImplCopyWith<_$TaskWithResultImpl> get copyWith =>
      __$$TaskWithResultImplCopyWithImpl<_$TaskWithResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskWithResultImplToJson(
      this,
    );
  }
}

abstract class _TaskWithResult implements TaskWithResult {
  const factory _TaskWithResult(
          {required final String id,
          required final Point start,
          required final Point end,
          required final List<String> field,
          @JsonKey(name: 'result') required final Result result}) =
      _$TaskWithResultImpl;

  factory _TaskWithResult.fromJson(Map<String, dynamic> json) =
      _$TaskWithResultImpl.fromJson;

  @override
  String get id;
  @override
  Point get start;
  @override
  Point get end;
  @override
  List<String> get field;
  @override
  @JsonKey(name: 'result')
  Result get result;
  @override
  @JsonKey(ignore: true)
  _$$TaskWithResultImplCopyWith<_$TaskWithResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
