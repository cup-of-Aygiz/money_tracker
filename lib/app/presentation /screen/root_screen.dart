import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/router/app_router.dart';
import 'package:money_tracker/uikit/uikit.dart';

@RoutePage()
class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      appRouter.tabRouter
          .setActiveIndex(appRouter.tabs.indexOf(const HomeRoute()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AutoTabsScaffold(
        routes: appRouter.tabs,
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            type: BottomNavigationBarType.fixed,
            enableFeedback: false,
            onTap: (index) {
              if (index == tabsRouter.activeIndex) {
                if (appRouter.tabRouter.canPop()) {
                  appRouter.tabRouter.maybePopTop();
                }
              }
              tabsRouter.setActiveIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                activeIcon: const Icon(Icons.add),
                icon: const Icon(Icons.add),
                label: context.locale.added,
              ),
              BottomNavigationBarItem(
                activeIcon: const GradientChild(
                  child: Icon(Icons.home),
                ),
                icon: const Icon(Icons.home),
                label: context.locale.home,
              ),
              BottomNavigationBarItem(
                activeIcon: const Icon(Icons.analytics),
                icon: const Icon(Icons.analytics),
                label: context.locale.analytics,
              ),
            ],
          );
        },
      ),
    );
  }
}
