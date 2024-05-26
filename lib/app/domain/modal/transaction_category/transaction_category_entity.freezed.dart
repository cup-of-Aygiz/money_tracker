// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_category_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionCategoryEntity _$TransactionCategoryEntityFromJson(
    Map<String, dynamic> json) {
  return _TransactionCategoryEntity.fromJson(json);
}

/// @nodoc
mixin _$TransactionCategoryEntity {
  String get key => throw _privateConstructorUsedError;

  /// сумма трат по категории
  double get amount => throw _privateConstructorUsedError;

  /// ограничение по категории
  double get limitAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCategoryEntityCopyWith<TransactionCategoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCategoryEntityCopyWith<$Res> {
  factory $TransactionCategoryEntityCopyWith(TransactionCategoryEntity value,
          $Res Function(TransactionCategoryEntity) then) =
      _$TransactionCategoryEntityCopyWithImpl<$Res, TransactionCategoryEntity>;
  @useResult
  $Res call({String key, double amount, double limitAmount});
}

/// @nodoc
class _$TransactionCategoryEntityCopyWithImpl<$Res,
        $Val extends TransactionCategoryEntity>
    implements $TransactionCategoryEntityCopyWith<$Res> {
  _$TransactionCategoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? amount = null,
    Object? limitAmount = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      limitAmount: null == limitAmount
          ? _value.limitAmount
          : limitAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionCategoryEntityImplCopyWith<$Res>
    implements $TransactionCategoryEntityCopyWith<$Res> {
  factory _$$TransactionCategoryEntityImplCopyWith(
          _$TransactionCategoryEntityImpl value,
          $Res Function(_$TransactionCategoryEntityImpl) then) =
      __$$TransactionCategoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, double amount, double limitAmount});
}

/// @nodoc
class __$$TransactionCategoryEntityImplCopyWithImpl<$Res>
    extends _$TransactionCategoryEntityCopyWithImpl<$Res,
        _$TransactionCategoryEntityImpl>
    implements _$$TransactionCategoryEntityImplCopyWith<$Res> {
  __$$TransactionCategoryEntityImplCopyWithImpl(
      _$TransactionCategoryEntityImpl _value,
      $Res Function(_$TransactionCategoryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? amount = null,
    Object? limitAmount = null,
  }) {
    return _then(_$TransactionCategoryEntityImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      limitAmount: null == limitAmount
          ? _value.limitAmount
          : limitAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionCategoryEntityImpl implements _TransactionCategoryEntity {
  const _$TransactionCategoryEntityImpl(
      {required this.key, this.amount = 0, this.limitAmount = 0});

  factory _$TransactionCategoryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionCategoryEntityImplFromJson(json);

  @override
  final String key;

  /// сумма трат по категории
  @override
  @JsonKey()
  final double amount;

  /// ограничение по категории
  @override
  @JsonKey()
  final double limitAmount;

  @override
  String toString() {
    return 'TransactionCategoryEntity(key: $key, amount: $amount, limitAmount: $limitAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionCategoryEntityImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.limitAmount, limitAmount) ||
                other.limitAmount == limitAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, amount, limitAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionCategoryEntityImplCopyWith<_$TransactionCategoryEntityImpl>
      get copyWith => __$$TransactionCategoryEntityImplCopyWithImpl<
          _$TransactionCategoryEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionCategoryEntityImplToJson(
      this,
    );
  }
}

abstract class _TransactionCategoryEntity implements TransactionCategoryEntity {
  const factory _TransactionCategoryEntity(
      {required final String key,
      final double amount,
      final double limitAmount}) = _$TransactionCategoryEntityImpl;

  factory _TransactionCategoryEntity.fromJson(Map<String, dynamic> json) =
      _$TransactionCategoryEntityImpl.fromJson;

  @override
  String get key;
  @override

  /// сумма трат по категории
  double get amount;
  @override

  /// ограничение по категории
  double get limitAmount;
  @override
  @JsonKey(ignore: true)
  _$$TransactionCategoryEntityImplCopyWith<_$TransactionCategoryEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
