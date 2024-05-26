// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionCategoryEntityImpl _$$TransactionCategoryEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionCategoryEntityImpl(
      key: json['key'] as String,
      amount: (json['amount'] as num?)?.toDouble() ?? 0,
      limitAmount: (json['limitAmount'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$TransactionCategoryEntityImplToJson(
        _$TransactionCategoryEntityImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'amount': instance.amount,
      'limitAmount': instance.limitAmount,
    };
