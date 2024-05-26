import 'package:injectable/injectable.dart';
import 'package:money_tracker/di/injectable.config.dart';
import 'package:money_tracker/di/service_locator.dart';

@InjectableInit()
Future<void> configureDependencies(String environment) async {
  locator.init(environment: environment);
}
