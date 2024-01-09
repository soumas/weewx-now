// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'value_agg_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValueAggDataEntity {
  String get at => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get units => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueAggDataEntityCopyWith<ValueAggDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueAggDataEntityCopyWith<$Res> {
  factory $ValueAggDataEntityCopyWith(
          ValueAggDataEntity value, $Res Function(ValueAggDataEntity) then) =
      _$ValueAggDataEntityCopyWithImpl<$Res, ValueAggDataEntity>;
  @useResult
  $Res call({String at, double value, String units});
}

/// @nodoc
class _$ValueAggDataEntityCopyWithImpl<$Res, $Val extends ValueAggDataEntity>
    implements $ValueAggDataEntityCopyWith<$Res> {
  _$ValueAggDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? at = null,
    Object? value = null,
    Object? units = null,
  }) {
    return _then(_value.copyWith(
      at: null == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ValueAggDataEntityImplCopyWith<$Res>
    implements $ValueAggDataEntityCopyWith<$Res> {
  factory _$$ValueAggDataEntityImplCopyWith(_$ValueAggDataEntityImpl value,
          $Res Function(_$ValueAggDataEntityImpl) then) =
      __$$ValueAggDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String at, double value, String units});
}

/// @nodoc
class __$$ValueAggDataEntityImplCopyWithImpl<$Res>
    extends _$ValueAggDataEntityCopyWithImpl<$Res, _$ValueAggDataEntityImpl>
    implements _$$ValueAggDataEntityImplCopyWith<$Res> {
  __$$ValueAggDataEntityImplCopyWithImpl(_$ValueAggDataEntityImpl _value,
      $Res Function(_$ValueAggDataEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? at = null,
    Object? value = null,
    Object? units = null,
  }) {
    return _then(_$ValueAggDataEntityImpl(
      at: null == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ValueAggDataEntityImpl implements _ValueAggDataEntity {
  _$ValueAggDataEntityImpl(
      {required this.at, required this.value, required this.units});

  @override
  final String at;
  @override
  final double value;
  @override
  final String units;

  @override
  String toString() {
    return 'ValueAggDataEntity(at: $at, value: $value, units: $units)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValueAggDataEntityImpl &&
            (identical(other.at, at) || other.at == at) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.units, units) || other.units == units));
  }

  @override
  int get hashCode => Object.hash(runtimeType, at, value, units);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ValueAggDataEntityImplCopyWith<_$ValueAggDataEntityImpl> get copyWith =>
      __$$ValueAggDataEntityImplCopyWithImpl<_$ValueAggDataEntityImpl>(
          this, _$identity);
}

abstract class _ValueAggDataEntity implements ValueAggDataEntity {
  factory _ValueAggDataEntity(
      {required final String at,
      required final double value,
      required final String units}) = _$ValueAggDataEntityImpl;

  @override
  String get at;
  @override
  double get value;
  @override
  String get units;
  @override
  @JsonKey(ignore: true)
  _$$ValueAggDataEntityImplCopyWith<_$ValueAggDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
