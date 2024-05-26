import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:gap/gap.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_state.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/di/service_locator.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/uikit/button/app_text_button.dart';
import 'package:money_tracker/uikit/drop_down/switch_enum_drop_down.dart';
import 'package:money_tracker/uikit/flush_bar/app_flush_bar.dart';
import 'package:money_tracker/uikit/text_field/app_text_filed.dart';
import 'package:money_tracker/utils/string/string_utils.dart';

class AddedLimitCategoryView extends StatefulWidget {
  const AddedLimitCategoryView({
    super.key,
  });

  @override
  State<AddedLimitCategoryView> createState() => _AddedLimitCategoryViewState();
}

class _AddedLimitCategoryViewState extends State<AddedLimitCategoryView> {
  TransactionCategoryEntity _transactionCategoryEntity =
      TransactionCategoryEntity.miscellaneous;
  final TextEditingController _amountController = TextEditingController();
  final CurrencyTextInputFormatter _formatter = FormatString.formatter;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyTrackerStore, MoneyTrackerState>(
      builder: (context, state) {
        return Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  const Gap(32),
                  SwitchEnumDropDown<TransactionCategoryEntity>(
                    labelText: context.locale.choseCategoryTransaction,
                    initialValue: _transactionCategoryEntity,
                    key: ValueKey(_transactionCategoryEntity.key),
                    onChanged: (value) {
                      _transactionCategoryEntity = value;
                      if (state.categoryExists(value.key)) {
                        TransactionCategoryEntity category =
                            state.limitedCategoryList.firstWhere(
                          (category) => category.key == value.key,
                        );
                        _amountController.value = TextEditingValue(
                          text: _formatter.formatString(
                            category.limitAmount
                                .toString()
                                .roundStringToTwoDecimals,
                          ),
                        );
                        _transactionCategoryEntity = category;
                      }

                      setState(() {});
                    },
                    items: TransactionCategoryEntity.expenseCategories,
                    textTile: (TransactionCategoryEntity value) {
                      return value.nameForUser(context);
                    },
                    titleTextColor: (TransactionCategoryEntity value) {
                      return value.getColorForCategory();
                    },
                    textColor: _transactionCategoryEntity.getColorForCategory(),
                  ),
                  const Gap(16),
                  AppTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    labelText: context.locale.limitAmount,
                    controller: _amountController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (string) {
                      /// добавляем цифры после запятой если их не указали
                      String str = string;
                      if (!string.contains(',')) {
                        str += ',00';
                      }
                      _amountController.value = TextEditingValue(
                        text: _formatter
                            .formatString(str.roundStringToTwoDecimals),
                      );

                      double? amount = double.tryParse(
                        str
                            .replaceAll(' ', '')
                            .replaceAll(' ', '')
                            .replaceAll(',', '.'),
                      );

                      if (amount == null) {
                        return;
                      }
                      _transactionCategoryEntity = _transactionCategoryEntity
                          .copyWith(limitAmount: amount);
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: KeyboardVisibilityBuilder(
                  builder: (context, isKeyboardVisible) {
                return isKeyboardVisible
                    ? const SizedBox.shrink()
                    : AppTextButton(
                        text:
                            state.categoryExists(_transactionCategoryEntity.key)
                                ? context.locale.editLimit
                                : context.locale.addedLimit,
                        onPressed: () {
                          state.categoryExists(_transactionCategoryEntity.key)
                              ? showAddedNewTransactionFlushBar(
                                  context,
                                  title: context.locale.limitUpdated(
                                    _transactionCategoryEntity
                                        .nameForUser(context),
                                  ),
                                )
                              : showAddedNewTransactionFlushBar(
                                  context,
                                  title: context.locale.limitAdded(
                                    _transactionCategoryEntity
                                        .nameForUser(context),
                                  ),
                                );
                          locator
                              .get<MoneyTrackerStore>()
                              .createAndEditLimitCategory(
                                  transactionCategoryEntity:
                                      _transactionCategoryEntity);
                        },
                      );
              }),
            ),
          ],
        );
      },
    );
  }
}
