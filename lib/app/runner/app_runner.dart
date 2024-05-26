import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:money_tracker/app/presentation%20/app_builder.dart';
import 'package:money_tracker/di/injectable.dart';
import 'package:path_provider/path_provider.dart';

class MainAppRunner {
  Future<void> preloadData() async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );
    await configureDependencies('dev');
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
    );
  }

  void handleZonedException(error, StackTrace stackTrace) {}

  Future<void> run(MainAppBuilder builder) async {
    await runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        await preloadData();
        runApp(builder.buildApp());
      },
      handleZonedException,
    );
  }
}
