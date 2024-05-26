import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/di/service_locator.dart';
import 'package:money_tracker/features/add_change_transaction/presentation/components/transactions_field_view.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/uikit/uikit.dart';

@RoutePage()
class EditTransactionScreen extends StatefulWidget {
  const EditTransactionScreen({super.key, required this.transactionEntity});

  final TransactionEntity transactionEntity;

  @override
  State<EditTransactionScreen> createState() => _EditTransactionScreenState();
}

class _EditTransactionScreenState extends State<EditTransactionScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TransactionEntity _transactionEntity;

  @override
  void initState() {
    super.initState();
    _transactionEntity = widget.transactionEntity;
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            context.locale.editTransaction,
            style: AppTextStyle.defaultTitle,
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TransactionsFieldView(
                  transactionEntity: widget.transactionEntity,
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
                        text: context.locale.save,
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            locator
                                .get<MoneyTrackerStore>()
                                .editTransaction(_transactionEntity);
                            Navigator.of(context).pop();
                          }
                        },
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
