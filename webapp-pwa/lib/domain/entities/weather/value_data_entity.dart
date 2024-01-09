import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_data_entity.freezed.dart';

@freezed
class ValueDataEntity with _$ValueDataEntity {
  factory ValueDataEntity({
    required double value,
    required String units,
  }) = _ValueDataEntity;
}
