import 'dart:async';

import 'package:boby_movie_app/bootstrap/app_initializer.dart';
import 'package:boby_movie_app/bootstrap/di_container.dart';
import 'package:boby_movie_app/bootstrap/logger.dart';
import 'package:flutter/material.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppInitializer.init(); // Firebase, Hive, vb.
  await setupDI(); // get_it setup
  LoggerConfig.setup(); // debug vs prod logging

  runApp(await builder());
}
