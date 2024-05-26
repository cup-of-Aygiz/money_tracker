import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/router/app_router.dart';
import 'package:money_tracker/uikit/button/app_text_button.dart';
import 'package:money_tracker/uikit/text_style/app_text_style.dart';

class NotEnoughAnalyticsData extends StatelessWidget {
  const NotEnoughAnalyticsData({super.key, this.padding});

  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.locale.notEnoughAnalyticsData,
          style: AppTextStyle.defaultBody,
        ),
        const Gap(8),
        Padding(
          padding: padding ?? const EdgeInsets.only(right: 16),
          child: AppTextButton(
            onPressed: () {
              context.router.navigate(const AddTransactionRoute());
            },
            text: context.locale.addedTransaction,
          ),
        )
      ],
    );
  }
}
