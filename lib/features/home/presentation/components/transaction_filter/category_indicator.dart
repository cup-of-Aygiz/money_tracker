import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/uikit/colors/app_colors.dart';
import 'package:money_tracker/uikit/text_style/app_text_style.dart';

class CategoryIndicator extends StatelessWidget {
  const CategoryIndicator({
    super.key,
    required this.categoryEntity,
  });

  final TransactionCategoryEntity categoryEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryEntity.getColorForCategory().withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(2),
            DecoratedBox(
              decoration: BoxDecoration(
                color: categoryEntity.getColorForCategory(),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: categoryEntity.getIconForCategory(
                  size: 16,
                ),
              ),
            ),
            const Gap(4),
            Flexible(
              child: Text(
                categoryEntity.nameForUser(context),
                style: AppTextStyle.defaultBody.copyWith(
                  color: AppColors.black,
                ),
                overflow: TextOverflow.fade,
              ),
            ),
            const Gap(2),
          ],
        ),
      ),
    );
  }
}
