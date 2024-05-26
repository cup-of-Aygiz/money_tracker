import 'package:money_tracker/app/presentation%20/app_builder.dart';
import 'package:money_tracker/app/runner/app_runner.dart';
import 'package:money_tracker/router/app_router.dart';

void main() {
  final runner = MainAppRunner();
  final builder = MainAppBuilder(appRouter);
  runner.run(builder);
}
