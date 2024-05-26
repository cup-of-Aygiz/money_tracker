import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/di/service_locator.dart';
import 'package:money_tracker/features/add_change_transaction/presentation/components/transactions_field_view.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/uikit/flush_bar/app_flush_bar.dart';
import 'package:money_tracker/uikit/uikit.dart';

import 'package:money_tracker/features/add_limit_category/presentaion/screen/components/added_limit_categorey_view.dart';

@RoutePage()
class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TransactionEntity _transactionEntity = TransactionEntity(
    id: '',
    name: '',
    amount: 0,
    type: TransactionType.expense,
    category: TransactionCategoryEntity.miscellaneous,
    date: DateTime.now(),
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(onTapChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(onTapChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Scaffold(
        appBar: AppBar(
          title: AnimatedBuilder(
            animation: _tabController,
            builder: (context, _) {
              return Text(
                [
                  context.locale.addedTransaction,
                  context.locale.addedLimit
                ][_tabController.index],
                style: AppTextStyle.defaultTitle,
              );
            },
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: context.locale.addedTransaction),
              Tab(text: context.locale.addedLimit),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TransactionsFieldView(
                      transactionEntity: _transactionEntity,
                      onChange: (transactionEntity) {
                        _transactionEntity = transactionEntity;
                      },
                      formKey: _formKey,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: KeyboardVisibilityBuilder(
                    builder: (context, isKeyboardVisible) {
                      return isKeyboardVisible
                          ? const SizedBox.shrink()
                          : AppTextButton(
                              text: context.locale.addedTransaction,
                              onPressed: () {
                                if (_formKey.currentState?.validate() == true) {
                                  showAddedNewTransactionFlushBar(
                                    context,
                                    title: context.locale.transactionAdded(
                                      _transactionEntity.name,
                                    ),
                                  );
                                  locator
                                      .get<MoneyTrackerStore>()
                                      .addedTransaction(_transactionEntity);
                                  setState(() {});
                                }
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: AddedLimitCategoryView(),
            ),
          ],
        ),
      ),
    );
  }

  void onTapChange() {
    FocusScope.of(context).unfocus();
  }
}
