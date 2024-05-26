import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/app/presentation%20/screen/root_screen.dart';
import 'package:money_tracker/features/add_change_transaction/presentation/screen/added_transaction_screen.dart';
import 'package:money_tracker/features/add_change_transaction/presentation/screen/edit_transaction_screen.dart';
import 'package:money_tracker/features/analytics/presentation/analytics_screen.dart';
import 'package:money_tracker/features/home/presentation/screen/home_screen.dart';

part 'app_router.gr.dart';

final appRouter = AppRouter();

@AutoRouterConfig(
  replaceInRouteName: 'Screen|Modal,Route',
)
class AppRouter extends _$AppRouter {
  static const appSchema = 'bristolmobile';
  static const appSchemaPath = 'bristolmobile://app';

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: RootRoute.page,
      path: '/',
      guards: const [],
      children: [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AddTransactionRoute.page),
        AutoRoute(page: AnalyticsRoute.page),
      ],
    ),
    AutoRoute(page: EditTransactionRoute.page),
  ];

  TabsRouter get tabRouter => childControllers.whereType<TabsRouter>().last;

  List<PageRouteInfo<dynamic>> get tabs => const [
        AddTransactionRoute(),
        HomeRoute(),
        AnalyticsRoute(),
      ];
}
