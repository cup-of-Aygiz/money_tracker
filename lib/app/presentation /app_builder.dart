import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/di/service_locator.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/uikit/theme/dark_theme.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class MainAppBuilder {
  MainAppBuilder(this.appRouter);

  final RootStackRouter appRouter;

  /// Глобальные кубиты
  List<SingleChildWidget> get providers => [
        BlocProvider.value(value: locator.get<MoneyTrackerStore>()),
      ];

  Widget buildApp() {
    return Builder(
      builder: _getMaterialApp,
    );
  }

  Widget _getMaterialApp(BuildContext context) => MultiProvider(
        providers: providers,
        child: MaterialApp.router(
          title: 'Money',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: Localization.localizationDelegates,
          builder: (context, router) => MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: router!,
          ),
          supportedLocales: Localization.supportedLocales,
          routerConfig: appRouter.config(),
          themeMode: ThemeMode.dark,
          theme: darkThemeData,
        ),
      );
}
