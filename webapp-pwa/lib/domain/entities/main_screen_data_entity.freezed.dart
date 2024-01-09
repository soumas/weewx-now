// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_screen_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MainScreenDataEntity {
  String get stationname => throw _privateConstructorUsedError;
  WeatherDataEntity get weather => throw _privateConstructorUsedError;
  ImagesEntity get images => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainScreenDataEntityCopyWith<MainScreenDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainScreenDataEntityCopyWith<$Res> {
  factory $MainScreenDataEntityCopyWith(MainScreenDataEntity value,
          $Res Function(MainScreenDataEntity) then) =
      _$MainScreenDataEntityCopyWithImpl<$Res, MainScreenDataEntity>;
  @useResult
  $Res call(
      {String stationname, WeatherDataEntity weather, ImagesEntity images});

  $WeatherDataEntityCopyWith<$Res> get weather;
  $ImagesEntityCopyWith<$Res> get images;
}

/// @nodoc
class _$MainScreenDataEntityCopyWithImpl<$Res,
        $Val extends MainScreenDataEntity>
    implements $MainScreenDataEntityCopyWith<$Res> {
  _$MainScreenDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationname = null,
    Object? weather = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      stationname: null == stationname
          ? _value.stationname
          : stationname // ignore: cast_nullable_to_non_nullable
              as String,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as WeatherDataEntity,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as ImagesEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherDataEntityCopyWith<$Res> get weather {
    return $WeatherDataEntityCopyWith<$Res>(_value.weather, (value) {
      return _then(_value.copyWith(weather: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImagesEntityCopyWith<$Res> get images {
    return $ImagesEntityCopyWith<$Res>(_value.images, (value) {
      return _then(_value.copyWith(images: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MainScreenDataEntityImplCopyWith<$Res>
    implements $MainScreenDataEntityCopyWith<$Res> {
  factory _$$MainScreenDataEntityImplCopyWith(_$MainScreenDataEntityImpl value,
          $Res Function(_$MainScreenDataEntityImpl) then) =
      __$$MainScreenDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stationname, WeatherDataEntity weather, ImagesEntity images});

  @override
  $WeatherDataEntityCopyWith<$Res> get weather;
  @override
  $ImagesEntityCopyWith<$Res> get images;
}

/// @nodoc
class __$$MainScreenDataEntityImplCopyWithImpl<$Res>
    extends _$MainScreenDataEntityCopyWithImpl<$Res, _$MainScreenDataEntityImpl>
    implements _$$MainScreenDataEntityImplCopyWith<$Res> {
  __$$MainScreenDataEntityImplCopyWithImpl(_$MainScreenDataEntityImpl _value,
      $Res Function(_$MainScreenDataEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stationname = null,
    Object? weather = null,
    Object? images = null,
  }) {
    return _then(_$MainScreenDataEntityImpl(
      stationname: null == stationname
          ? _value.stationname
          : stationname // ignore: cast_nullable_to_non_nullable
              as String,
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as WeatherDataEntity,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as ImagesEntity,
    ));
  }
}

/// @nodoc

class _$MainScreenDataEntityImpl implements _MainScreenDataEntity {
  _$MainScreenDataEntityImpl(
      {required this.stationname, required this.weather, required this.images});

  @override
  final String stationname;
  @override
  final WeatherDataEntity weather;
  @override
  final ImagesEntity images;

  @override
  String toString() {
    return 'MainScreenDataEntity(stationname: $stationname, weather: $weather, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainScreenDataEntityImpl &&
            (identical(other.stationname, stationname) ||
                other.stationname == stationname) &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.images, images) || other.images == images));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stationname, weather, images);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainScreenDataEntityImplCopyWith<_$MainScreenDataEntityImpl>
      get copyWith =>
          __$$MainScreenDataEntityImplCopyWithImpl<_$MainScreenDataEntityImpl>(
              this, _$identity);
}

abstract class _MainScreenDataEntity implements MainScreenDataEntity {
  factory _MainScreenDataEntity(
      {required final String stationname,
      required final WeatherDataEntity weather,
      required final ImagesEntity images}) = _$MainScreenDataEntityImpl;

  @override
  String get stationname;
  @override
  WeatherDataEntity get weather;
  @override
  ImagesEntity get images;
  @override
  @JsonKey(ignore: true)
  _$$MainScreenDataEntityImplCopyWith<_$MainScreenDataEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
