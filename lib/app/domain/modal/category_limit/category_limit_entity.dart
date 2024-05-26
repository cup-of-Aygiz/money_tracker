import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_limit_entity.freezed.dart';

@freezed
class CategoryLimit with _$CategoryLimit {
  const factory CategoryLimit({
    required DateTime limitDate,
    required num limit,
  }) = _CategoryLimit;

  // factory CategoryLimit.fromJson(Map<String, dynamic> json) =>
  //     _$CategoryLimitFromJson(json);
}
