import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_agg_data_entity.freezed.dart';

@freezed
class ValueAggDataEntity with _$ValueAggDataEntity {
  factory ValueAggDataEntity({
    required String at,
    required double value,
    required String units,
  }) = _ValueAggDataEntity;
}
