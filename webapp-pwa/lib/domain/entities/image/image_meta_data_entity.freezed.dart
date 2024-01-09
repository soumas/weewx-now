// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_meta_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageMetaDataEntity {
  ImageCategoryEntity get category => throw _privateConstructorUsedError;
  String get filename => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageMetaDataEntityCopyWith<ImageMetaDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageMetaDataEntityCopyWith<$Res> {
  factory $ImageMetaDataEntityCopyWith(
          ImageMetaDataEntity value, $Res Function(ImageMetaDataEntity) then) =
      _$ImageMetaDataEntityCopyWithImpl<$Res, ImageMetaDataEntity>;
  @useResult
  $Res call({ImageCategoryEntity category, String filename, DateTime date});

  $ImageCategoryEntityCopyWith<$Res> get category;
}

/// @nodoc
class _$ImageMetaDataEntityCopyWithImpl<$Res, $Val extends ImageMetaDataEntity>
    implements $ImageMetaDataEntityCopyWith<$Res> {
  _$ImageMetaDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? filename = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ImageCategoryEntity,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageCategoryEntityCopyWith<$Res> get category {
    return $ImageCategoryEntityCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ImageMetaDataEntityImplCopyWith<$Res>
    implements $ImageMetaDataEntityCopyWith<$Res> {
  factory _$$ImageMetaDataEntityImplCopyWith(_$ImageMetaDataEntityImpl value,
          $Res Function(_$ImageMetaDataEntityImpl) then) =
      __$$ImageMetaDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageCategoryEntity category, String filename, DateTime date});

  @override
  $ImageCategoryEntityCopyWith<$Res> get category;
}

/// @nodoc
class __$$ImageMetaDataEntityImplCopyWithImpl<$Res>
    extends _$ImageMetaDataEntityCopyWithImpl<$Res, _$ImageMetaDataEntityImpl>
    implements _$$ImageMetaDataEntityImplCopyWith<$Res> {
  __$$ImageMetaDataEntityImplCopyWithImpl(_$ImageMetaDataEntityImpl _value,
      $Res Function(_$ImageMetaDataEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? filename = null,
    Object? date = null,
  }) {
    return _then(_$ImageMetaDataEntityImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as ImageCategoryEntity,
      filename: null == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ImageMetaDataEntityImpl implements _ImageMetaDataEntity {
  _$ImageMetaDataEntityImpl(
      {required this.category, required this.filename, required this.date});

  @override
  final ImageCategoryEntity category;
  @override
  final String filename;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'ImageMetaDataEntity(category: $category, filename: $filename, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageMetaDataEntityImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category, filename, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageMetaDataEntityImplCopyWith<_$ImageMetaDataEntityImpl> get copyWith =>
      __$$ImageMetaDataEntityImplCopyWithImpl<_$ImageMetaDataEntityImpl>(
          this, _$identity);
}

abstract class _ImageMetaDataEntity implements ImageMetaDataEntity {
  factory _ImageMetaDataEntity(
      {required final ImageCategoryEntity category,
      required final String filename,
      required final DateTime date}) = _$ImageMetaDataEntityImpl;

  @override
  ImageCategoryEntity get category;
  @override
  String get filename;
  @override
  DateTime get date;
  @override
  @JsonKey(ignore: true)
  _$$ImageMetaDataEntityImplCopyWith<_$ImageMetaDataEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
