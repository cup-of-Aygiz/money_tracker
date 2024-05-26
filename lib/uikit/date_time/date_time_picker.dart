import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/uikit/button/app_text_button.dart';
import 'package:money_tracker/utils/date_time/date_time_constants.dart';

class DateTimePicker extends StatelessWidget {
  const DateTimePicker({
    super.key,
    this.initialDateTime,
    this.maximumDate,
  });

  static Future<DateTime?> showModalDatePicker(
    BuildContext context, {
    DateTime? initialDateTime,
    DateTime? maximumDate,
  }) {
    return showModalBottomSheet(
        useRootNavigator: false,
        context: context,
        builder: (BuildContext context) {
          return DateTimePicker(
            initialDateTime: initialDateTime,
            maximumDate: maximumDate,
          );
        });
  }

  final DateTime? initialDateTime;
  final DateTime? maximumDate;

  @override
  Widget build(BuildContext context) {
    var pickedDate = initialDateTime;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 2,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: initialDateTime,
                minimumDate: DateTimeConstants.minimumDate,
                maximumDate: maximumDate,
                onDateTimeChanged: (value) {
                  pickedDate = value;
                },
              ),
            ),
            AppTextButton(
              onPressed: () {
                context.router.maybePop(pickedDate);
              },
              text: context.locale.complete,
            )
          ],
        ),
      ),
    );
  }
}
