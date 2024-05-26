// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddTransactionRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddTransactionScreen(),
      );
    },
    AnalyticsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AnalyticsScreen(),
      );
    },
    EditTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<EditTransactionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditTransactionScreen(
          key: args.key,
          transactionEntity: args.transactionEntity,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootScreen(),
      );
    },
  };
}

/// generated route for
/// [AddTransactionScreen]
class AddTransactionRoute extends PageRouteInfo<void> {
  const AddTransactionRoute({List<PageRouteInfo>? children})
      : super(
          AddTransactionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTransactionRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AnalyticsScreen]
class AnalyticsRoute extends PageRouteInfo<void> {
  const AnalyticsRoute({List<PageRouteInfo>? children})
      : super(
          AnalyticsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AnalyticsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditTransactionScreen]
class EditTransactionRoute extends PageRouteInfo<EditTransactionRouteArgs> {
  EditTransactionRoute({
    Key? key,
    required TransactionEntity transactionEntity,
    List<PageRouteInfo>? children,
  }) : super(
          EditTransactionRoute.name,
          args: EditTransactionRouteArgs(
            key: key,
            transactionEntity: transactionEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'EditTransactionRoute';

  static const PageInfo<EditTransactionRouteArgs> page =
      PageInfo<EditTransactionRouteArgs>(name);
}

class EditTransactionRouteArgs {
  const EditTransactionRouteArgs({
    this.key,
    required this.transactionEntity,
  });

  final Key? key;

  final TransactionEntity transactionEntity;

  @override
  String toString() {
    return 'EditTransactionRouteArgs{key: $key, transactionEntity: $transactionEntity}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RootScreen]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
