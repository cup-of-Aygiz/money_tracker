// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterEntity {
  TransactionType? get type => throw _privateConstructorUsedError;
  TransactionCategoryEntity? get category => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterEntityCopyWith<FilterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterEntityCopyWith<$Res> {
  factory $FilterEntityCopyWith(
          FilterEntity value, $Res Function(FilterEntity) then) =
      _$FilterEntityCopyWithImpl<$Res, FilterEntity>;
  @useResult
  $Res call(
      {TransactionType? type,
      TransactionCategoryEntity? category,
      DateTime? startDate,
      DateTime? endDate,
      String? searchQuery});

  $TransactionCategoryEntityCopyWith<$Res>? get category;
}

/// @nodoc
class _$FilterEntityCopyWithImpl<$Res, $Val extends FilterEntity>
    implements $FilterEntityCopyWith<$Res> {
  _$FilterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? category = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategoryEntity?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionCategoryEntityCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $TransactionCategoryEntityCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FilterEntityImplCopyWith<$Res>
    implements $FilterEntityCopyWith<$Res> {
  factory _$$FilterEntityImplCopyWith(
          _$FilterEntityImpl value, $Res Function(_$FilterEntityImpl) then) =
      __$$FilterEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransactionType? type,
      TransactionCategoryEntity? category,
      DateTime? startDate,
      DateTime? endDate,
      String? searchQuery});

  @override
  $TransactionCategoryEntityCopyWith<$Res>? get category;
}

/// @nodoc
class __$$FilterEntityImplCopyWithImpl<$Res>
    extends _$FilterEntityCopyWithImpl<$Res, _$FilterEntityImpl>
    implements _$$FilterEntityImplCopyWith<$Res> {
  __$$FilterEntityImplCopyWithImpl(
      _$FilterEntityImpl _value, $Res Function(_$FilterEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? category = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? searchQuery = freezed,
  }) {
    return _then(_$FilterEntityImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategoryEntity?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      searchQuery: freezed == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FilterEntityImpl implements _FilterEntity {
  const _$FilterEntityImpl(
      {this.type,
      this.category,
      this.startDate,
      this.endDate,
      this.searchQuery});

  @override
  final TransactionType? type;
  @override
  final TransactionCategoryEntity? category;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final String? searchQuery;

  @override
  String toString() {
    return 'FilterEntity(type: $type, category: $category, startDate: $startDate, endDate: $endDate, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterEntityImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, type, category, startDate, endDate, searchQuery);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterEntityImplCopyWith<_$FilterEntityImpl> get copyWith =>
      __$$FilterEntityImplCopyWithImpl<_$FilterEntityImpl>(this, _$identity);
}

abstract class _FilterEntity implements FilterEntity {
  const factory _FilterEntity(
      {final TransactionType? type,
      final TransactionCategoryEntity? category,
      final DateTime? startDate,
      final DateTime? endDate,
      final String? searchQuery}) = _$FilterEntityImpl;

  @override
  TransactionType? get type;
  @override
  TransactionCategoryEntity? get category;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  String? get searchQuery;
  @override
  @JsonKey(ignore: true)
  _$$FilterEntityImplCopyWith<_$FilterEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
