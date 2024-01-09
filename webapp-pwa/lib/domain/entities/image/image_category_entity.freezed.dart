// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_category_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageCategoryEntity {
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageCategoryEntityCopyWith<ImageCategoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCategoryEntityCopyWith<$Res> {
  factory $ImageCategoryEntityCopyWith(
          ImageCategoryEntity value, $Res Function(ImageCategoryEntity) then) =
      _$ImageCategoryEntityCopyWithImpl<$Res, ImageCategoryEntity>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$ImageCategoryEntityCopyWithImpl<$Res, $Val extends ImageCategoryEntity>
    implements $ImageCategoryEntityCopyWith<$Res> {
  _$ImageCategoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageCategoryEntityImplCopyWith<$Res>
    implements $ImageCategoryEntityCopyWith<$Res> {
  factory _$$ImageCategoryEntityImplCopyWith(_$ImageCategoryEntityImpl value,
          $Res Function(_$ImageCategoryEntityImpl) then) =
      __$$ImageCategoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ImageCategoryEntityImplCopyWithImpl<$Res>
    extends _$ImageCategoryEntityCopyWithImpl<$Res, _$ImageCategoryEntityImpl>
    implements _$$ImageCategoryEntityImplCopyWith<$Res> {
  __$$ImageCategoryEntityImplCopyWithImpl(_$ImageCategoryEntityImpl _value,
      $Res Function(_$ImageCategoryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ImageCategoryEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImageCategoryEntityImpl implements _ImageCategoryEntity {
  _$ImageCategoryEntityImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'ImageCategoryEntity(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageCategoryEntityImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageCategoryEntityImplCopyWith<_$ImageCategoryEntityImpl> get copyWith =>
      __$$ImageCategoryEntityImplCopyWithImpl<_$ImageCategoryEntityImpl>(
          this, _$identity);
}

abstract class _ImageCategoryEntity implements ImageCategoryEntity {
  factory _ImageCategoryEntity({required final String id}) =
      _$ImageCategoryEntityImpl;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$ImageCategoryEntityImplCopyWith<_$ImageCategoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
