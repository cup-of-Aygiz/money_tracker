import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/uikit/uikit.dart';
import 'package:money_tracker/utils/date_time/date_time_utils.dart';
import 'package:money_tracker/utils/string/string_utils.dart';

class TransactionsFieldView extends StatefulWidget {
  const TransactionsFieldView({
    super.key,
    required this.transactionEntity,
    required this.onChange,
    required this.formKey,
  });

  final TransactionEntity transactionEntity;
  final Function(TransactionEntity) onChange;
  final GlobalKey<FormState> formKey;

  @override
  State<TransactionsFieldView> createState() => _TransactionsFieldViewState();
}

class _TransactionsFieldViewState extends State<TransactionsFieldView> {
  late TextEditingController _amountController;

  final CurrencyTextInputFormatter _formatter = FormatString.formatter;
  final FocusNode _focusNode = FocusNode();
  late TransactionEntity _transactionEntity;

  @override
  void initState() {
    super.initState();
    _transactionEntity = widget.transactionEntity;
    _amountController = TextEditingController();
    _amountController.value = TextEditingValue(
      text:
          _formatter.formatString(_transactionEntity.amount.toStringAsFixed(2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const Gap(32),
          AppTextField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            labelText: context.locale.choseNameTransaction,
            initialText: _transactionEntity.name,
            onSubmitted: (name) {
              _transactionEntity = _transactionEntity.copyWith(name: name);
              widget.onChange(_transactionEntity);
              FocusScope.of(context).requestFocus(_focusNode);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return context.locale.requiredField;
              }
              return null;
            },
          ),
          const Gap(16),
          AppTextField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            focusNode: _focusNode,
            labelText: context.locale.sumTransaction,
            controller: _amountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            onSubmitted: (string) {
              /// добавляем цифры после запятой если их не указали
              String str = string;
              if (!string.contains(',')) {
                str += ',00';
              }
              _amountController.value = TextEditingValue(
                text: _formatter.formatString(str.roundStringToTwoDecimals),
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
              _transactionEntity = _transactionEntity.copyWith(amount: amount);
              widget.onChange(_transactionEntity);
            },
            validator: (value) {
              if (value == null || value.isEmpty || value == '0,00') {
                return context.locale.transactionAmountValid;
              }
              return null;
            },
          ),
          const Gap(16),
          SwitchEnumDropDown<TransactionType>(
            labelText: context.locale.choseTypeTransaction,
            initialValue: _transactionEntity.type,
            onChanged: (value) {
              if (value == _transactionEntity.type) {
                return;
              }
              _transactionEntity = _transactionEntity.copyWith(
                type: value,
                category: TransactionCategoryEntity.miscellaneous,
              );
              widget.onChange(_transactionEntity);
              setState(() {});
            },
            items: TransactionType.values,
            textTile: (TransactionType value) {
              return value.nameForUser(context);
            },
            titleTextColor: (TransactionType value) {
              return value.getColorForType();
            },
            textColor: _transactionEntity.type.getColorForType(),
          ),
          const Gap(16),
          SwitchEnumDropDown<TransactionCategoryEntity>(
            labelText: context.locale.choseCategoryTransaction,
            initialValue: _transactionEntity.category,
            key: ValueKey(_transactionEntity.category),
            onChanged: (value) {
              _transactionEntity = _transactionEntity.copyWith(category: value);
              widget.onChange(_transactionEntity);
              setState(() {});
            },
            items: _transactionEntity.type == TransactionType.expense
                ? TransactionCategoryEntity.expenseCategories
                : TransactionCategoryEntity.incomeCategories,
            textTile: (TransactionCategoryEntity value) {
              return value.nameForUser(context);
            },
            titleTextColor: (TransactionCategoryEntity value) {
              return value.getColorForCategory();
            },
            textColor: _transactionEntity.category.getColorForCategory(),
          ),
          const Gap(16),
          AppTextField(
            key: ValueKey(_transactionEntity.date),
            onTap: () {
              DateTimePicker.showModalDatePicker(
                context,
                initialDateTime: _transactionEntity.date,
                maximumDate: DateTime.now(),
              ).then((value) {
                if (value == null) {
                  return;
                }
                _transactionEntity = _transactionEntity.copyWith(
                  date: value,
                );
                widget.onChange(_transactionEntity);
                setState(() {});
              });
            },
            initialText: DateFormat(FormatDate.dayMonthYear)
                .format(_transactionEntity.date),
            readOnly: true,
            labelText: context.locale.choseDateTransaction,
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
