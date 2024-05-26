import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_state.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/di/service_locator.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/uikit/date_time/date_time_picker.dart';
import 'package:money_tracker/uikit/text_field/app_text_filed.dart';
import 'package:money_tracker/utils/date_time/date_time_utils.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({super.key});

  @override
  State<DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyTrackerStore, MoneyTrackerState>(
      builder: (context, state) {
        final startDate = state.filterEntity.startDate;
        final endDate = state.filterEntity.endDate;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: AppTextField(
                key: ValueKey(startDate),
                onTap: () {
                  DateTimePicker.showModalDatePicker(
                    context,
                    initialDateTime: _startDate,
                    maximumDate: state.filterEntity.endDate ?? DateTime.now(),
                  ).then((value) {
                    if (value == null) {
                      return;
                    }
                    _startDate = value;
                    locator.get<MoneyTrackerStore>().applyDatesFilter(
                        startDate: _startDate, endDate: _endDate);
                    setState(() {});
                  });
                },
                initialText: startDate == null
                    ? ''
                    : DateFormat(FormatDate.dayMonthYear).format(startDate),
                readOnly: true,
                labelText: context.locale.startDate,
              ),
            ),
            const Gap(16),
            Expanded(
              child: AppTextField(
                key: ValueKey(endDate),
                onTap: () {
                  DateTimePicker.showModalDatePicker(
                    context,
                    initialDateTime: _endDate,
                    maximumDate: DateTime.now(),
                  ).then((value) {
                    if (value == null) {
                      return;
                    }
                    _endDate = value;
                    locator.get<MoneyTrackerStore>().applyDatesFilter(
                        startDate: _startDate, endDate: _endDate);
                    if (_endDate.isBefore(_startDate)) {
                      _startDate = _endDate;
                    }
                    setState(() {});
                  });
                },
                initialText: endDate == null
                    ? ''
                    : DateFormat(FormatDate.dayMonthYear).format(endDate),
                readOnly: true,
                labelText: context.locale.endDate,
              ),
            ),
          ],
        );
      },
    );
  }
}
