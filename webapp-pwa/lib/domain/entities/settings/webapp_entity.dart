import 'package:freezed_annotation/freezed_annotation.dart';

part 'webapp_entity.freezed.dart';

@freezed
class WebappEntity with _$WebappEntity {
  factory WebappEntity({
    String? password,
  }) = _WebappEntity;
}
