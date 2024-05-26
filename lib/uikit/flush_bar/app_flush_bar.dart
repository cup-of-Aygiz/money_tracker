import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:money_tracker/app/domain/throttler.dart';
import 'package:money_tracker/uikit/colors/app_colors.dart';
import 'package:money_tracker/uikit/text_style/app_text_style.dart';

Throttler throttler = Throttler(throttleGapInMillis: 3000);

Future _buildFlushbar(
  BuildContext context, {
  required int durationSecond,
  required FlushbarPosition position,
  required Color backgroundColor,
  String? title,
  Widget? flushbarBody,
  Widget? icon,
}) {
  return Flushbar(
    duration: Duration(seconds: durationSecond),
    boxShadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, -1),
      ),
    ],
    padding: const EdgeInsets.all(18),
    margin: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: position == FlushbarPosition.BOTTOM
          ? kBottomNavigationBarHeight + 4
          : 0,
    ),
    backgroundColor: backgroundColor,
    flushbarPosition: position,
    borderRadius: BorderRadius.circular(7),
    icon: icon,
    messageText: title != null
        ? Text(
            title,
            style: AppTextStyle.body1Regular.copyWith(color: AppColors.black),
          )
        : flushbarBody,
  ).show(context);
}

Future<void> showAddedNewTransactionFlushBar<T>(
  BuildContext context, {
  required String title,
  Color color = AppColors.green,
  FlushbarPosition position = FlushbarPosition.TOP,
  int durationSecond = 5,
}) async {
  return throttler.run(() {
    _buildFlushbar(
      context,
      durationSecond: durationSecond,
      position: position,
      backgroundColor: color,
      title: title,
    );
  });
}

Future<void> showEditTransactionFlushBar<T>(
  BuildContext context, {
  required String title,
  Color color = AppColors.green,
  FlushbarPosition position = FlushbarPosition.TOP,
  int durationSecond = 5,
}) async {
  return throttler.run(() {
    _buildFlushbar(
      context,
      durationSecond: durationSecond,
      position: position,
      backgroundColor: color,
      title: title,
    );
  });
}

Future<void> showLimitCategoryFlushBar<T>(
  BuildContext context, {
  required String title,
  Color color = AppColors.green,
  FlushbarPosition position = FlushbarPosition.TOP,
  int durationSecond = 5,
}) async {
  return throttler.run(() {
    _buildFlushbar(
      context,
      durationSecond: durationSecond,
      position: position,
      backgroundColor: color,
      title: title,
    );
  });
}
