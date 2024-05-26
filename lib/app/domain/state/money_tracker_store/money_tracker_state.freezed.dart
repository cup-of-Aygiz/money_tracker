// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'money_tracker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoneyTrackerState _$MoneyTrackerStateFromJson(Map<String, dynamic> json) {
  return _MoneyTrackerState.fromJson(json);
}

/// @nodoc
mixin _$MoneyTrackerState {
  /// список всех транзакций
  List<TransactionEntity> get transactionsList =>
      throw _privateConstructorUsedError;

  /// отфильтрованные транзакции
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<TransactionEntity> get filteredTransactionsList =>
      throw _privateConstructorUsedError;

  /// список категорий с лимитами
  List<TransactionCategoryEntity> get limitedCategoryList =>
      throw _privateConstructorUsedError;

  /// фильтр транзакций
  @JsonKey(includeFromJson: false, includeToJson: false)
  FilterEntity get filterEntity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoneyTrackerStateCopyWith<MoneyTrackerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneyTrackerStateCopyWith<$Res> {
  factory $MoneyTrackerStateCopyWith(
          MoneyTrackerState value, $Res Function(MoneyTrackerState) then) =
      _$MoneyTrackerStateCopyWithImpl<$Res, MoneyTrackerState>;
  @useResult
  $Res call(
      {List<TransactionEntity> transactionsList,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<TransactionEntity> filteredTransactionsList,
      List<TransactionCategoryEntity> limitedCategoryList,
      @JsonKey(includeFromJson: false, includeToJson: false)
      FilterEntity filterEntity});

  $FilterEntityCopyWith<$Res> get filterEntity;
}

/// @nodoc
class _$MoneyTrackerStateCopyWithImpl<$Res, $Val extends MoneyTrackerState>
    implements $MoneyTrackerStateCopyWith<$Res> {
  _$MoneyTrackerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionsList = null,
    Object? filteredTransactionsList = null,
    Object? limitedCategoryList = null,
    Object? filterEntity = null,
  }) {
    return _then(_value.copyWith(
      transactionsList: null == transactionsList
          ? _value.transactionsList
          : transactionsList // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
      filteredTransactionsList: null == filteredTransactionsList
          ? _value.filteredTransactionsList
          : filteredTransactionsList // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
      limitedCategoryList: null == limitedCategoryList
          ? _value.limitedCategoryList
          : limitedCategoryList // ignore: cast_nullable_to_non_nullable
              as List<TransactionCategoryEntity>,
      filterEntity: null == filterEntity
          ? _value.filterEntity
          : filterEntity // ignore: cast_nullable_to_non_nullable
              as FilterEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FilterEntityCopyWith<$Res> get filterEntity {
    return $FilterEntityCopyWith<$Res>(_value.filterEntity, (value) {
      return _then(_value.copyWith(filterEntity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MoneyTrackerStateImplCopyWith<$Res>
    implements $MoneyTrackerStateCopyWith<$Res> {
  factory _$$MoneyTrackerStateImplCopyWith(_$MoneyTrackerStateImpl value,
          $Res Function(_$MoneyTrackerStateImpl) then) =
      __$$MoneyTrackerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<TransactionEntity> transactionsList,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<TransactionEntity> filteredTransactionsList,
      List<TransactionCategoryEntity> limitedCategoryList,
      @JsonKey(includeFromJson: false, includeToJson: false)
      FilterEntity filterEntity});

  @override
  $FilterEntityCopyWith<$Res> get filterEntity;
}

/// @nodoc
class __$$MoneyTrackerStateImplCopyWithImpl<$Res>
    extends _$MoneyTrackerStateCopyWithImpl<$Res, _$MoneyTrackerStateImpl>
    implements _$$MoneyTrackerStateImplCopyWith<$Res> {
  __$$MoneyTrackerStateImplCopyWithImpl(_$MoneyTrackerStateImpl _value,
      $Res Function(_$MoneyTrackerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionsList = null,
    Object? filteredTransactionsList = null,
    Object? limitedCategoryList = null,
    Object? filterEntity = null,
  }) {
    return _then(_$MoneyTrackerStateImpl(
      transactionsList: null == transactionsList
          ? _value._transactionsList
          : transactionsList // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
      filteredTransactionsList: null == filteredTransactionsList
          ? _value._filteredTransactionsList
          : filteredTransactionsList // ignore: cast_nullable_to_non_nullable
              as List<TransactionEntity>,
      limitedCategoryList: null == limitedCategoryList
          ? _value._limitedCategoryList
          : limitedCategoryList // ignore: cast_nullable_to_non_nullable
              as List<TransactionCategoryEntity>,
      filterEntity: null == filterEntity
          ? _value.filterEntity
          : filterEntity // ignore: cast_nullable_to_non_nullable
              as FilterEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoneyTrackerStateImpl implements _MoneyTrackerState {
  const _$MoneyTrackerStateImpl(
      {required final List<TransactionEntity> transactionsList,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<TransactionEntity> filteredTransactionsList = const [],
      final List<TransactionCategoryEntity> limitedCategoryList = const [],
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.filterEntity = const FilterEntity()})
      : _transactionsList = transactionsList,
        _filteredTransactionsList = filteredTransactionsList,
        _limitedCategoryList = limitedCategoryList;

  factory _$MoneyTrackerStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoneyTrackerStateImplFromJson(json);

  /// список всех транзакций
  final List<TransactionEntity> _transactionsList;

  /// список всех транзакций
  @override
  List<TransactionEntity> get transactionsList {
    if (_transactionsList is EqualUnmodifiableListView)
      return _transactionsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionsList);
  }

  /// отфильтрованные транзакции
  final List<TransactionEntity> _filteredTransactionsList;

  /// отфильтрованные транзакции
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<TransactionEntity> get filteredTransactionsList {
    if (_filteredTransactionsList is EqualUnmodifiableListView)
      return _filteredTransactionsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredTransactionsList);
  }

  /// список категорий с лимитами
  final List<TransactionCategoryEntity> _limitedCategoryList;

  /// список категорий с лимитами
  @override
  @JsonKey()
  List<TransactionCategoryEntity> get limitedCategoryList {
    if (_limitedCategoryList is EqualUnmodifiableListView)
      return _limitedCategoryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_limitedCategoryList);
  }

  /// фильтр транзакций
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final FilterEntity filterEntity;

  @override
  String toString() {
    return 'MoneyTrackerState(transactionsList: $transactionsList, filteredTransactionsList: $filteredTransactionsList, limitedCategoryList: $limitedCategoryList, filterEntity: $filterEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoneyTrackerStateImpl &&
            const DeepCollectionEquality()
                .equals(other._transactionsList, _transactionsList) &&
            const DeepCollectionEquality().equals(
                other._filteredTransactionsList, _filteredTransactionsList) &&
            const DeepCollectionEquality()
                .equals(other._limitedCategoryList, _limitedCategoryList) &&
            (identical(other.filterEntity, filterEntity) ||
                other.filterEntity == filterEntity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactionsList),
      const DeepCollectionEquality().hash(_filteredTransactionsList),
      const DeepCollectionEquality().hash(_limitedCategoryList),
      filterEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoneyTrackerStateImplCopyWith<_$MoneyTrackerStateImpl> get copyWith =>
      __$$MoneyTrackerStateImplCopyWithImpl<_$MoneyTrackerStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoneyTrackerStateImplToJson(
      this,
    );
  }
}

abstract class _MoneyTrackerState implements MoneyTrackerState {
  const factory _MoneyTrackerState(
      {required final List<TransactionEntity> transactionsList,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<TransactionEntity> filteredTransactionsList,
      final List<TransactionCategoryEntity> limitedCategoryList,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final FilterEntity filterEntity}) = _$MoneyTrackerStateImpl;

  factory _MoneyTrackerState.fromJson(Map<String, dynamic> json) =
      _$MoneyTrackerStateImpl.fromJson;

  @override

  /// список всех транзакций
  List<TransactionEntity> get transactionsList;
  @override

  /// отфильтрованные транзакции
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<TransactionEntity> get filteredTransactionsList;
  @override

  /// список категорий с лимитами
  List<TransactionCategoryEntity> get limitedCategoryList;
  @override

  /// фильтр транзакций
  @JsonKey(includeFromJson: false, includeToJson: false)
  FilterEntity get filterEntity;
  @override
  @JsonKey(ignore: true)
  _$$MoneyTrackerStateImplCopyWith<_$MoneyTrackerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
