// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_limit_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryLimit {
  DateTime get limitDate => throw _privateConstructorUsedError;
  num get limit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryLimitCopyWith<CategoryLimit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryLimitCopyWith<$Res> {
  factory $CategoryLimitCopyWith(
          CategoryLimit value, $Res Function(CategoryLimit) then) =
      _$CategoryLimitCopyWithImpl<$Res, CategoryLimit>;
  @useResult
  $Res call({DateTime limitDate, num limit});
}

/// @nodoc
class _$CategoryLimitCopyWithImpl<$Res, $Val extends CategoryLimit>
    implements $CategoryLimitCopyWith<$Res> {
  _$CategoryLimitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limitDate = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      limitDate: null == limitDate
          ? _value.limitDate
          : limitDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryLimitImplCopyWith<$Res>
    implements $CategoryLimitCopyWith<$Res> {
  factory _$$CategoryLimitImplCopyWith(
          _$CategoryLimitImpl value, $Res Function(_$CategoryLimitImpl) then) =
      __$$CategoryLimitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime limitDate, num limit});
}

/// @nodoc
class __$$CategoryLimitImplCopyWithImpl<$Res>
    extends _$CategoryLimitCopyWithImpl<$Res, _$CategoryLimitImpl>
    implements _$$CategoryLimitImplCopyWith<$Res> {
  __$$CategoryLimitImplCopyWithImpl(
      _$CategoryLimitImpl _value, $Res Function(_$CategoryLimitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limitDate = null,
    Object? limit = null,
  }) {
    return _then(_$CategoryLimitImpl(
      limitDate: null == limitDate
          ? _value.limitDate
          : limitDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$CategoryLimitImpl implements _CategoryLimit {
  const _$CategoryLimitImpl({required this.limitDate, required this.limit});

  @override
  final DateTime limitDate;
  @override
  final num limit;

  @override
  String toString() {
    return 'CategoryLimit(limitDate: $limitDate, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryLimitImpl &&
            (identical(other.limitDate, limitDate) ||
                other.limitDate == limitDate) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limitDate, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryLimitImplCopyWith<_$CategoryLimitImpl> get copyWith =>
      __$$CategoryLimitImplCopyWithImpl<_$CategoryLimitImpl>(this, _$identity);
}

abstract class _CategoryLimit implements CategoryLimit {
  const factory _CategoryLimit(
      {required final DateTime limitDate,
      required final num limit}) = _$CategoryLimitImpl;

  @override
  DateTime get limitDate;
  @override
  num get limit;
  @override
  @JsonKey(ignore: true)
  _$$CategoryLimitImplCopyWith<_$CategoryLimitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
