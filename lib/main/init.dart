import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import '../di/di_init.dart';
import 'app.dart';

void init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  setHashUrlStrategy();
  runApp(const App());
}
