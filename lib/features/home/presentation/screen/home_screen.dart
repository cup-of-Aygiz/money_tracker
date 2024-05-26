import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_state.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/features/home/presentation/components/money_transaction_list.dart';
import 'package:money_tracker/features/home/presentation/components/search_text_field.dart';
import 'package:money_tracker/features/home/presentation/components/transaction_filter/transaction_filter.dart';
import 'package:money_tracker/features/home/presentation/components/transactions_clear.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: BlocBuilder<MoneyTrackerStore, MoneyTrackerState>(
        builder: (context, state) {
          return Scaffold(
            /// TODO сделать обертку над AppBar
            appBar: AppBar(
              title: const SearchTextField(),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: TransactionFilter(),
                ),
                if (state.showTransactions.isNotEmpty)
                  SingleChildScrollView(
                    child: state.showTransactions.isNotEmpty
                        ? MoneyTransactionList(
                            list: state.showTransactions,
                          )
                        : const SizedBox.shrink(),
                  )
                else
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TransactionsClear(),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
