// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_tracker_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoneyTrackerStateImpl _$$MoneyTrackerStateImplFromJson(
        Map<String, dynamic> json) =>
    _$MoneyTrackerStateImpl(
      transactionsList: (json['transactionsList'] as List<dynamic>)
          .map((e) => TransactionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      limitedCategoryList: (json['limitedCategoryList'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionCategoryEntity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MoneyTrackerStateImplToJson(
        _$MoneyTrackerStateImpl instance) =>
    <String, dynamic>{
      'transactionsList': instance.transactionsList,
      'limitedCategoryList': instance.limitedCategoryList,
    };
