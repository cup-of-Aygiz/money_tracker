import 'package:flutter/material.dart';

class MoneyTrackerAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MoneyTrackerAppBar({required this.title, super.key});

  final Widget title;
  @override
  Widget build(BuildContext context) => SafeArea(child: Center(child: title));

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
