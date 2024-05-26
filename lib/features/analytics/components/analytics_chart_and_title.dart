import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:money_tracker/uikit/text_style/app_text_style.dart';

class AnalyticsChartAndTitle extends StatelessWidget {
  const AnalyticsChartAndTitle({
    super.key,
    required this.title,
    required this.child,
    this.aspectRatio = 1,
  });

  final String title;
  final Widget child;
  final double? aspectRatio;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.defaultHeadline2,
        ),
        const Gap(16),
        aspectRatio == null
            ? child
            : AspectRatio(aspectRatio: aspectRatio!, child: child),
      ],
    );
  }
}
