import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/uikit/text_style/app_text_style.dart';

import 'package:money_tracker/features/home/presentation/components/money_transaction.dart';

class MoneyTransactionList extends StatelessWidget {
  const MoneyTransactionList({super.key, required this.list});

  final List<TransactionEntity> list;

  @override
  Widget build(BuildContext context) {
    final Map<String, List<TransactionEntity>> groupedTransactions = {};

    for (var transaction in list) {
      final dateKey = _getDateKey(transaction.date);
      if (!groupedTransactions.containsKey(dateKey)) {
        groupedTransactions[dateKey] = [];
      }
      groupedTransactions[dateKey]!.add(transaction);
    }

    return Column(
      key: ValueKey(groupedTransactions.entries.length),
      children: groupedTransactions.entries.map((entry) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4, top: 4),
              child: Text(
                entry.key,
                style: AppTextStyle.textAppSubtitle1,
              ),
            ),
            ...entry.value.map((transaction) {
              return MoneyTransaction(
                transactionEntity: transaction,
                key: ValueKey(transaction.id),
              );
            }),
          ],
        );
      }).toList(),
    );
  }

  String _getDateKey(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year) {
      return DateFormat('d MMMM').format(date);
    } else {
      return DateFormat('d MMMM yyyy').format(date);
    }
  }
}
