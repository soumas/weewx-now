// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsEntity {
  StationEntity get station => throw _privateConstructorUsedError;
  WebappEntity get webapp => throw _privateConstructorUsedError;
  TextsEntity get texts => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsEntityCopyWith<SettingsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEntityCopyWith<$Res> {
  factory $SettingsEntityCopyWith(
          SettingsEntity value, $Res Function(SettingsEntity) then) =
      _$SettingsEntityCopyWithImpl<$Res, SettingsEntity>;
  @useResult
  $Res call({StationEntity station, WebappEntity webapp, TextsEntity texts});

  $StationEntityCopyWith<$Res> get station;
  $WebappEntityCopyWith<$Res> get webapp;
  $TextsEntityCopyWith<$Res> get texts;
}

/// @nodoc
class _$SettingsEntityCopyWithImpl<$Res, $Val extends SettingsEntity>
    implements $SettingsEntityCopyWith<$Res> {
  _$SettingsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? station = null,
    Object? webapp = null,
    Object? texts = null,
  }) {
    return _then(_value.copyWith(
      station: null == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as StationEntity,
      webapp: null == webapp
          ? _value.webapp
          : webapp // ignore: cast_nullable_to_non_nullable
              as WebappEntity,
      texts: null == texts
          ? _value.texts
          : texts // ignore: cast_nullable_to_non_nullable
              as TextsEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StationEntityCopyWith<$Res> get station {
    return $StationEntityCopyWith<$Res>(_value.station, (value) {
      return _then(_value.copyWith(station: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WebappEntityCopyWith<$Res> get webapp {
    return $WebappEntityCopyWith<$Res>(_value.webapp, (value) {
      return _then(_value.copyWith(webapp: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TextsEntityCopyWith<$Res> get texts {
    return $TextsEntityCopyWith<$Res>(_value.texts, (value) {
      return _then(_value.copyWith(texts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SettingsEntityImplCopyWith<$Res>
    implements $SettingsEntityCopyWith<$Res> {
  factory _$$SettingsEntityImplCopyWith(_$SettingsEntityImpl value,
          $Res Function(_$SettingsEntityImpl) then) =
      __$$SettingsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StationEntity station, WebappEntity webapp, TextsEntity texts});

  @override
  $StationEntityCopyWith<$Res> get station;
  @override
  $WebappEntityCopyWith<$Res> get webapp;
  @override
  $TextsEntityCopyWith<$Res> get texts;
}

/// @nodoc
class __$$SettingsEntityImplCopyWithImpl<$Res>
    extends _$SettingsEntityCopyWithImpl<$Res, _$SettingsEntityImpl>
    implements _$$SettingsEntityImplCopyWith<$Res> {
  __$$SettingsEntityImplCopyWithImpl(
      _$SettingsEntityImpl _value, $Res Function(_$SettingsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? station = null,
    Object? webapp = null,
    Object? texts = null,
  }) {
    return _then(_$SettingsEntityImpl(
      station: null == station
          ? _value.station
          : station // ignore: cast_nullable_to_non_nullable
              as StationEntity,
      webapp: null == webapp
          ? _value.webapp
          : webapp // ignore: cast_nullable_to_non_nullable
              as WebappEntity,
      texts: null == texts
          ? _value.texts
          : texts // ignore: cast_nullable_to_non_nullable
              as TextsEntity,
    ));
  }
}

/// @nodoc

class _$SettingsEntityImpl implements _SettingsEntity {
  _$SettingsEntityImpl(
      {required this.station, required this.webapp, required this.texts});

  @override
  final StationEntity station;
  @override
  final WebappEntity webapp;
  @override
  final TextsEntity texts;

  @override
  String toString() {
    return 'SettingsEntity(station: $station, webapp: $webapp, texts: $texts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsEntityImpl &&
            (identical(other.station, station) || other.station == station) &&
            (identical(other.webapp, webapp) || other.webapp == webapp) &&
            (identical(other.texts, texts) || other.texts == texts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, station, webapp, texts);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsEntityImplCopyWith<_$SettingsEntityImpl> get copyWith =>
      __$$SettingsEntityImplCopyWithImpl<_$SettingsEntityImpl>(
          this, _$identity);
}

abstract class _SettingsEntity implements SettingsEntity {
  factory _SettingsEntity(
      {required final StationEntity station,
      required final WebappEntity webapp,
      required final TextsEntity texts}) = _$SettingsEntityImpl;

  @override
  StationEntity get station;
  @override
  WebappEntity get webapp;
  @override
  TextsEntity get texts;
  @override
  @JsonKey(ignore: true)
  _$$SettingsEntityImplCopyWith<_$SettingsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
