// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'images_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImagesEntity {
  DateTime get generation => throw _privateConstructorUsedError;
  Map<ImageCategoryEntity, List<ImageMetaDataEntity>> get map =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImagesEntityCopyWith<ImagesEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImagesEntityCopyWith<$Res> {
  factory $ImagesEntityCopyWith(
          ImagesEntity value, $Res Function(ImagesEntity) then) =
      _$ImagesEntityCopyWithImpl<$Res, ImagesEntity>;
  @useResult
  $Res call(
      {DateTime generation,
      Map<ImageCategoryEntity, List<ImageMetaDataEntity>> map});
}

/// @nodoc
class _$ImagesEntityCopyWithImpl<$Res, $Val extends ImagesEntity>
    implements $ImagesEntityCopyWith<$Res> {
  _$ImagesEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generation = null,
    Object? map = null,
  }) {
    return _then(_value.copyWith(
      generation: null == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      map: null == map
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as Map<ImageCategoryEntity, List<ImageMetaDataEntity>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImagesEntityImplCopyWith<$Res>
    implements $ImagesEntityCopyWith<$Res> {
  factory _$$ImagesEntityImplCopyWith(
          _$ImagesEntityImpl value, $Res Function(_$ImagesEntityImpl) then) =
      __$$ImagesEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime generation,
      Map<ImageCategoryEntity, List<ImageMetaDataEntity>> map});
}

/// @nodoc
class __$$ImagesEntityImplCopyWithImpl<$Res>
    extends _$ImagesEntityCopyWithImpl<$Res, _$ImagesEntityImpl>
    implements _$$ImagesEntityImplCopyWith<$Res> {
  __$$ImagesEntityImplCopyWithImpl(
      _$ImagesEntityImpl _value, $Res Function(_$ImagesEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generation = null,
    Object? map = null,
  }) {
    return _then(_$ImagesEntityImpl(
      generation: null == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as DateTime,
      map: null == map
          ? _value._map
          : map // ignore: cast_nullable_to_non_nullable
              as Map<ImageCategoryEntity, List<ImageMetaDataEntity>>,
    ));
  }
}

/// @nodoc

class _$ImagesEntityImpl implements _ImagesEntity {
  _$ImagesEntityImpl(
      {required this.generation,
      required final Map<ImageCategoryEntity, List<ImageMetaDataEntity>> map})
      : _map = map;

  @override
  final DateTime generation;
  final Map<ImageCategoryEntity, List<ImageMetaDataEntity>> _map;
  @override
  Map<ImageCategoryEntity, List<ImageMetaDataEntity>> get map {
    if (_map is EqualUnmodifiableMapView) return _map;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_map);
  }

  @override
  String toString() {
    return 'ImagesEntity(generation: $generation, map: $map)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImagesEntityImpl &&
            (identical(other.generation, generation) ||
                other.generation == generation) &&
            const DeepCollectionEquality().equals(other._map, _map));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, generation, const DeepCollectionEquality().hash(_map));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImagesEntityImplCopyWith<_$ImagesEntityImpl> get copyWith =>
      __$$ImagesEntityImplCopyWithImpl<_$ImagesEntityImpl>(this, _$identity);
}

abstract class _ImagesEntity implements ImagesEntity {
  factory _ImagesEntity(
      {required final DateTime generation,
      required final Map<ImageCategoryEntity, List<ImageMetaDataEntity>>
          map}) = _$ImagesEntityImpl;

  @override
  DateTime get generation;
  @override
  Map<ImageCategoryEntity, List<ImageMetaDataEntity>> get map;
  @override
  @JsonKey(ignore: true)
  _$$ImagesEntityImplCopyWith<_$ImagesEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
