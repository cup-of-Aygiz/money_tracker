import 'package:flutter/material.dart';
import 'package:money_tracker/uikit/uikit.dart';

import 'package:money_tracker/uikit/button/clickable_resizer.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textStyle,
  });

  final VoidCallback onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClickableResizer(
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.onyx10,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: SizedBox(
          height: 56,
          child: Center(
            child: Text(
              text,
              style: textStyle ??
                  AppTextStyle.body1SemiBold.copyWith(
                    color: AppColors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
